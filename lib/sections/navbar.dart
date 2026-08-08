import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

import '../i18n/i18n.dart';

/// Header / navigation bar. Reads and mutates language + theme via
/// [I18nScope] — see `lib/i18n/i18n_state.dart` for the pattern.
class Navbar extends StatefulComponent {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _closeMenu() {
    if (_isMenuOpen) {
      setState(() {
        _isMenuOpen = false;
      });
    }
  }

  @override
  Component build(BuildContext context) {
    final scope = I18nScope.of(context);

    void scrollTo(String id) {
      _closeMenu();
      if (!kIsWeb) return;
      final currentHash = web.window.location.hash;
      if (currentHash.contains('privacy') || currentHash.contains('form')) {
        web.window.location.hash = id.isEmpty ? '#' : '#$id';
      } else {
        if (id.isEmpty) {
          web.window.scrollTo(web.ScrollToOptions(top: 0));
          web.window.location.hash = '';
        } else {
          final target = web.document.getElementById(id);
          if (target != null) {
            target.scrollIntoView();
            web.window.location.hash = '#$id';
          } else {
            web.window.location.hash = '#$id';
          }
        }
      }
    }

    return header(classes: 'navbar${_isMenuOpen ? ' menu-open' : ''}', [
      div(classes: 'nav-container', [
        div(classes: 'nav-brand-group', [
          button(
            classes: 'btn-icon menu-toggle',
            attributes: {'aria-label': _isMenuOpen ? 'Close menu' : 'Open menu'},
            onClick: _toggleMenu,
            [
              if (!_isMenuOpen)
                svg(viewBox: '0 0 24 24', attributes: {'width': '22', 'height': '22', 'fill': 'none', 'stroke': 'currentColor', 'stroke-width': '2'}, [
                  line(x1: '3', y1: '12', x2: '21', y2: '12', []),
                  line(x1: '3', y1: '6', x2: '21', y2: '6', []),
                  line(x1: '3', y1: '18', x2: '21', y2: '18', []),
                ])
              else
                svg(viewBox: '0 0 24 24', attributes: {'width': '22', 'height': '22', 'fill': 'none', 'stroke': 'currentColor', 'stroke-width': '2'}, [
                  line(x1: '18', y1: '6', x2: '6', y2: '18', []),
                  line(x1: '6', y1: '6', x2: '18', y2: '18', []),
                ]),
            ],
          ),
          a(
            classes: 'brand',
            href: '#',
            onClick: () => scrollTo(''),
            [
              img(src: './app_icon.png', alt: 'Coinky Logo', attributes: {'width': '32', 'height': '32', 'style': 'border-radius: 8px;'}),
              span(classes: 'brand-name', [.text('Coinky')]),
            ],
          ),
        ]),
        nav(classes: 'nav-links desktop-only', [
          a(
            href: '#features',
            onClick: () => scrollTo('features'),
            [.text(t(context, 'nav_features'))],
          ),
          a(
            href: '#showcase',
            onClick: () => scrollTo('showcase'),
            [.text(t(context, 'nav_experience'))],
          ),
          a(
            href: '#faq',
            onClick: () => scrollTo('faq'),
            [.text(t(context, 'nav_faq'))],
          ),
          a(
            href: '#form',
            onClick: () {
              _closeMenu();
              if (kIsWeb) {
                web.window.location.hash = '#form';
              }
            },
            [.text(t(context, 'nav_contact'))],
          ),
        ]),
        div(classes: 'nav-actions', [
          select(
            classes: 'lang-select lang-select-desktop',
            value: scope.lang,
            attributes: {'aria-label': 'Select language'},
            onChange: (values) {
              if (values.isNotEmpty) scope.setLanguage(values.first);
            },
            [
              option(value: 'en', [.text('🇺🇸 English')]),
              option(value: 'pt', [.text('🇧🇷 Português')]),
              option(value: 'es', [.text('🇪🇸 Español')]),
            ],
          ),
          select(
            classes: 'lang-select lang-select-mobile',
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
          a(
            classes: 'btn btn-primary nav-download-btn',
            href: '#download',
            attributes: {'aria-label': t(context, 'nav_download')},
            onClick: _closeMenu,
            [
              svg(viewBox: '0 0 24 24', attributes: {'width': '20', 'height': '20', 'fill': 'none', 'stroke': 'currentColor', 'stroke-width': '2'}, [
                path(d: 'M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4', []),
                polyline(points: '7 10 12 15 17 10', []),
                line(x1: '12', y1: '15', x2: '12', y2: '3', []),
              ]),
            ],
          ),
        ]),
      ]),
      if (_isMenuOpen)
        div(classes: 'mobile-menu', [
          nav(classes: 'mobile-nav-links', [
            a(
              href: '#features',
              onClick: () => scrollTo('features'),
              [.text(t(context, 'nav_features'))],
            ),
            a(
              href: '#showcase',
              onClick: () => scrollTo('showcase'),
              [.text(t(context, 'nav_experience'))],
            ),
            a(
              href: '#faq',
              onClick: () => scrollTo('faq'),
              [.text(t(context, 'nav_faq'))],
            ),
            a(
              href: '#form',
              onClick: () {
                _closeMenu();
                if (kIsWeb) {
                  web.window.location.hash = '#form';
                }
              },
              [.text(t(context, 'nav_contact'))],
            ),
          ]),
        ]),
    ]);
  }
}
