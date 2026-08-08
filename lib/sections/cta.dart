import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../i18n/i18n.dart';
import 'coming_soon_button.dart';

/// Download banner / call-to-action section.
class Cta extends StatelessComponent {
  const Cta({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'download', classes: 'section cta-section', [
      div(classes: 'cta-bg-glow', []),
      div(classes: 'container cta-container', [
        div(classes: 'cta-card glass-card text-center', [
          img(classes: 'cta-logo', src: './coinky_logo.svg', alt: 'Coinky', attributes: {'width': '64', 'height': '64'}),
          h2(classes: 'cta-title', [.text(t(context, 'cta_title'))]),
          p(classes: 'cta-subtitle', [.text(t(context, 'cta_subtitle'))]),
          div(classes: 'cta-buttons', [
            ComingSoonButton(
              label: t(context, 'cta_btn'),
              href: '#',
              isComingSoon: true,
              icon: svg(viewBox: '0 0 24 24', attributes: {'width': '20', 'height': '20', 'fill': 'currentColor'}, [
                path(
                  d:
                      'M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M15.97 6.86c.66-.8 1.11-1.92.99-3.04-.96.04-2.13.64-2.82 1.44-.61.71-1.15 1.86-1.01 2.97 1.07.08 2.17-.57 2.84-1.37z',
                  [],
                ),
              ]),
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
