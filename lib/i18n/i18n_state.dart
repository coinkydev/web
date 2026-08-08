/// Shared reactive language + theme state for the Coinky marketing site.
///
/// ## Pattern
///
/// This follows Jaspr's recommended "lift state to the root `@client`
/// component, expose via `InheritedComponent`" pattern (the Jaspr analogue
/// of Flutter's `InheritedWidget` + `StatefulWidget`):
///
/// 1. `App` (see `lib/app.dart`) is the single `@client` root component. It
///    is a `StatefulComponent` that owns the current language code and
///    theme mode as private state.
/// 2. `App.build()` wraps its entire child tree in an [I18nScope], an
///    [InheritedComponent] that carries the current `lang`/`themeMode`
///    plus the `setLanguage`/`toggleTheme` callbacks needed to mutate them.
/// 3. Everything else in the tree — static section components and any
///    smaller interactive islands (theme toggle button, language select,
///    showcase tabs, etc.) — are plain (non-`@client`) components. Because
///    they are all built inside `App`'s single client bundle, they can read
///    [I18nScope] via `I18nScope.of(context)` and will rebuild automatically
///    whenever the language or theme changes, without needing their own
///    `@client` annotation or their own state.
///
/// Only `App` needs `@client`. Do NOT add `@client` to individual sections
/// (navbar, hero, showcase, etc.) — that would create separate,
/// independently-hydrated islands that can no longer share this state.
///
/// ## How to consume this from any component
///
/// ```dart
/// import 'package:coinky_web/i18n/i18n_state.dart';
///
/// class MyWidget extends StatelessComponent {
///   @override
///   Component build(BuildContext context) {
///     return p([.text(t(context, 'hero_subtitle'))]);
///   }
/// }
/// ```
///
/// - `t(context, key)` looks up a flat translation string in the current
///   language (falls back to English, then to the raw key if missing).
/// - `showcaseData(context, key)` looks up a nested `showcase_data` entry
///   (keys `"01"`..`"04"`) as a `{title, desc, list}` map.
/// - To read/change language or theme directly (e.g. from the language
///   `<select>` or theme toggle button island), use
///   `I18nScope.of(context)` to get `.lang`, `.themeMode`, `.setLanguage(...)`,
///   and `.toggleTheme()`.
library;

import 'package:jaspr/jaspr.dart';

import 'translations.dart';

/// localStorage key used to persist the user's chosen language.
/// Matches the original vanilla-JS site (`main.js`) for compatibility.
const langStorageKey = 'coinky_lang';

/// Language codes supported by [translations], in the order they should
/// appear in any language switcher UI.
const supportedLanguages = ['en', 'pt', 'es'];

/// Fallback language used when no stored/browser preference matches, and
/// as the fallback table when a key is missing from the active language.
const defaultLanguage = 'en';

/// Theme mode mirrors the `.dark` / `.light` class toggled on `<html>` by
/// the original site's theme button.
enum AppThemeMode {
  light,
  dark;

  /// The CSS class name applied to `<html>` for this mode, matching
  /// `style.css`'s `.dark` / `.light` selectors.
  String get htmlClass => this == dark ? 'dark' : 'light';
}

/// Provides the current language + theme, and the callbacks to change them,
/// to the entire component tree below it.
///
/// Obtain the nearest instance with [I18nScope.of]. See the library-level
/// doc comment above for the full usage pattern.
class I18nScope extends InheritedComponent {
  const I18nScope({
    required this.lang,
    required this.themeMode,
    required this.setLanguage,
    required this.toggleTheme,
    required super.child,
    super.key,
  });

  /// Current active language code, one of [supportedLanguages].
  final String lang;

  /// Current active theme mode.
  final AppThemeMode themeMode;

  /// Changes the active language and persists it to `localStorage`
  /// (client-side only; no-op during server pre-rendering).
  final void Function(String lang) setLanguage;

  /// Toggles between [AppThemeMode.light] and [AppThemeMode.dark].
  final void Function() toggleTheme;

  /// Returns the nearest [I18nScope] above [context] in the tree.
  ///
  /// Throws in debug mode if no [I18nScope] is found — every component
  /// using `t()`/`showcaseData()`/`I18nScope.of()` must be built somewhere
  /// below the root `App` component, which provides this scope.
  static I18nScope of(BuildContext context) {
    final scope = context.dependOnInheritedComponentOfExactType<I18nScope>();
    assert(scope != null, 'No I18nScope found in context. Components must be built below the root App component.');
    return scope!;
  }

  @override
  bool updateShouldNotify(covariant I18nScope oldComponent) {
    return lang != oldComponent.lang || themeMode != oldComponent.themeMode;
  }
}

/// Looks up the translated string for [key] in the current language.
///
/// Falls back to [defaultLanguage] if the active language is missing a key,
/// and to [key] itself (so missing translations are visibly obvious rather
/// than crashing the page).
String t(BuildContext context, String key) {
  final lang = I18nScope.of(context).lang;
  final table = translations[lang] ?? translations[defaultLanguage]!;
  final fallback = translations[defaultLanguage]!;
  final value = table[key] ?? fallback[key];
  return value is String ? value : key;
}

/// Looks up a `showcase_data` entry (keys `"01"`..`"04"`) for the current
/// language, returning `{title: String, desc: String, list: List<String>}`.
Map<String, dynamic> showcaseData(BuildContext context, String key) {
  final lang = I18nScope.of(context).lang;
  final table = translations[lang] ?? translations[defaultLanguage]!;
  final fallbackTable = translations[defaultLanguage]!;
  final data =
      (table['showcase_data'] as Map<String, dynamic>?) ?? (fallbackTable['showcase_data'] as Map<String, dynamic>);
  return data[key] as Map<String, dynamic>;
}

/// Resolves the initial language for a fresh visitor, mirroring
/// `main.js#getInitialLang`: `pt*`/`es*` browser locales map to `pt`/`es`,
/// everything else falls back to [defaultLanguage]. Callers on the client
/// should prefer a stored `localStorage` value over this when present.
String initialLanguageFromLocale(String browserLocale) {
  if (browserLocale.startsWith('pt')) return 'pt';
  if (browserLocale.startsWith('es')) return 'es';
  return defaultLanguage;
}
