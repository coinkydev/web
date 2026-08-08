import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

import '../i18n/i18n.dart';

/// Site footer.
class SiteFooter extends StatelessComponent {
  const SiteFooter({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'footer', [
      div(classes: 'container footer-container', [
        div(classes: 'footer-brand', [
          span(classes: 'brand-name', [.text('Coinky')]),
          p([.text(t(context, 'footer_desc'))]),
        ]),
        div(classes: 'footer-links', [
          a(
            href: '#privacy',
            onClick: () {
              if (kIsWeb) {
                web.window.location.hash = '#privacy';
              }
            },
            [.text(t(context, 'footer_privacy'))],
          ),
          a(
            href: '#form',
            onClick: () {
              if (kIsWeb) {
                web.window.location.hash = '#form';
              }
            },
            [.text(t(context, 'footer_contact'))],
          ),
          a(href: '#', [.text(t(context, 'footer_terms'))]),
        ]),
        div(classes: 'footer-copy', [.text(t(context, 'footer_rights'))]),
      ]),
    ]);
  }
}
