import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../i18n/i18n.dart';

/// Header / navigation bar. Reads and mutates language + theme via
/// [I18nScope] — see `lib/i18n/i18n_state.dart` for the pattern.
class Navbar extends StatelessComponent {
  const Navbar({super.key});

  @override
  Component build(BuildContext context) {
    final scope = I18nScope.of(context);

    return header(classes: 'navbar', [
      div(classes: 'nav-container', [
        a(classes: 'brand', href: '#', [
          img(src: './app_icon.png', alt: 'Coinky Logo', attributes: {'width': '32', 'height': '32', 'style': 'border-radius: 8px;'}),
          span(classes: 'brand-name', [.text('Coinky')]),
        ]),
        nav(classes: 'nav-links', [
          a(href: '#features', [.text(t(context, 'nav_features'))]),
          a(href: '#showcase', [.text(t(context, 'nav_experience'))]),
          a(href: '#faq', [.text(t(context, 'nav_faq'))]),
        ]),
        div(classes: 'nav-actions', [
          select(
            classes: 'lang-select',
            value: scope.lang,
            attributes: {'aria-label': 'Select language'},
            onChange: (values) {
              if (values.isNotEmpty) scope.setLanguage(values.first);
            },
            [
              option(value: 'en', [.text('🇺🇸 EN')]),
              option(value: 'pt', [.text('🇧🇷 PT')]),
              option(value: 'es', [.text('🇪🇸 ES')]),
            ],
          ),
          button(
            classes: 'btn-icon',
            attributes: {'aria-label': 'Toggle light/dark mode'},
            onClick: scope.toggleTheme,
            [
              svg(classes: 'sun-icon', viewBox: '0 0 24 24', attributes: {'width': '20', 'height': '20', 'fill': 'none', 'stroke': 'currentColor', 'stroke-width': '2'}, [
                circle(cx: '12', cy: '12', r: '5', []),
                line(x1: '12', y1: '1', x2: '12', y2: '3', []),
                line(x1: '12', y1: '21', x2: '12', y2: '23', []),
                line(x1: '4.22', y1: '4.22', x2: '5.64', y2: '5.64', []),
                line(x1: '18.36', y1: '18.36', x2: '19.78', y2: '19.78', []),
                line(x1: '1', y1: '12', x2: '3', y2: '12', []),
                line(x1: '21', y1: '12', x2: '23', y2: '12', []),
                line(x1: '4.22', y1: '19.78', x2: '5.64', y2: '18.36', []),
                line(x1: '18.36', y1: '5.64', x2: '19.78', y2: '4.22', []),
              ]),
              svg(classes: 'moon-icon', viewBox: '0 0 24 24', attributes: {'width': '20', 'height': '20', 'fill': 'none', 'stroke': 'currentColor', 'stroke-width': '2'}, [
                path(d: 'M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z', []),
              ]),
            ],
          ),
          a(classes: 'btn btn-primary', href: '#download', [.text(t(context, 'nav_download'))]),
        ]),
      ]),
    ]);
  }
}
