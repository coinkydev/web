import 'package:jaspr/jaspr.dart';
import 'package:universal_web/js_interop.dart';
import 'package:universal_web/web.dart' as web;

import 'i18n/i18n.dart';
import 'sections/sections.dart';

/// Root component of the site.
///
/// This is the ONLY `@client` component in the app (see the pattern
/// documented in `lib/i18n/i18n_state.dart`). It owns the current
/// language + theme as state and exposes them to the whole tree via
/// [I18nScope]. All page sections (see `lib/sections/`) are plain,
/// non-`@client` components built inside [build] below, so they hydrate as
/// part of this single client bundle and can read [I18nScope] reactively.
@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  String _lang = defaultLanguage;
  AppThemeMode _themeMode = AppThemeMode.dark;
  String _hash = '';

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _lang = _resolveInitialLanguage();
      _hash = web.window.location.hash;
      if (_hash.contains('privacy') || _hash.contains('form')) {
        web.window.scrollTo(web.ScrollToOptions(top: 0));
      } else if (_hash.isNotEmpty) {
        final id = _hash.replaceAll('#', '');
        Future.delayed(const Duration(milliseconds: 100), () {
          final target = web.document.getElementById(id);
          target?.scrollIntoView();
        });
      }
      final updateHash = (web.Event event) {
        final newHash = web.window.location.hash;
        final wasSubpage = _hash.contains('privacy') || _hash.contains('form');
        final isSubpage = newHash.contains('privacy') || newHash.contains('form');

        setState(() {
          _hash = newHash;
        });

        if (isSubpage) {
          web.window.scrollTo(web.ScrollToOptions(top: 0));
        } else if (wasSubpage) {
          final id = newHash.replaceAll('#', '');
          Future.delayed(const Duration(milliseconds: 50), () {
            if (id.isNotEmpty) {
              final target = web.document.getElementById(id);
              if (target != null) {
                target.scrollIntoView();
              } else {
                web.window.scrollTo(web.ScrollToOptions(top: 0));
              }
            } else {
              web.window.scrollTo(web.ScrollToOptions(top: 0));
            }
          });
        }
      }.toJS;
      web.window.addEventListener('hashchange', updateHash);
      web.window.addEventListener('popstate', updateHash);
    }
  }

  /// Mirrors `main.js`: prefer a previously-stored language, otherwise
  /// derive it from the browser locale.
  String _resolveInitialLanguage() {
    final stored = web.window.localStorage.getItem(langStorageKey);
    if (stored != null && supportedLanguages.contains(stored)) {
      return stored;
    }
    return initialLanguageFromLocale(web.window.navigator.language);
  }

  void _setLanguage(String lang) {
    if (lang == _lang) return;
    setState(() => _lang = lang);
    if (kIsWeb) {
      web.window.localStorage.setItem(langStorageKey, lang);
    }
  }

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == AppThemeMode.dark ? AppThemeMode.light : AppThemeMode.dark;
    });
  }

  @override
  Component build(BuildContext context) {
    final isPrivacyPage = _hash.contains('privacy');
    final isFormPage = _hash.contains('form');

    return Component.fragment([
      // Declaratively keeps `<html class="dark|light" lang="...">` in sync
      // with state. `Document.html` works both during server pre-render
      // and on the client, so no manual DOM manipulation is needed here —
      // just update state and this re-renders the attributes.
      Document.html(attributes: {'class': _themeMode.htmlClass, 'lang': _lang}),
      I18nScope(
        lang: _lang,
        themeMode: _themeMode,
        setLanguage: _setLanguage,
        toggleTheme: _toggleTheme,
        child: Component.fragment([
          const Navbar(),
          if (isPrivacyPage)
            const PrivacyPolicy()
          else if (isFormPage)
            const FormSection()
          else ...[
            const Hero(),
            const Features(),
            const Showcase(),
            const Faq(),
            const Cta(),
          ],
          const SiteFooter(),
        ]),
      ),
    ]);
  }
}
