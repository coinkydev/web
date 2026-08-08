import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../i18n/i18n.dart';

/// Hero section: headline, subtitle, CTAs, highlights and phone mockup.
class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'hero-section', [
      div(classes: 'hero-bg-glow', []),
      div(classes: 'container hero-container', [
        div(classes: 'hero-content', [
          div(classes: 'badge-pill', [
            span(classes: 'badge-pulse', []),
            span([.text(t(context, 'hero_badge'))]),
          ]),
          h1(classes: 'hero-title', [
            span([.text(t(context, 'hero_title_1'))]),
            br(),
            span(classes: 'text-gradient', [.text(t(context, 'hero_title_2'))]),
          ]),
          p(classes: 'hero-subtitle', [.text(t(context, 'hero_subtitle'))]),
          div(classes: 'hero-cta-group', [
            a(classes: 'btn btn-primary btn-lg', href: '#download', [
              span([.text(t(context, 'hero_cta_appstore'))]),
            ]),
            a(classes: 'btn btn-secondary btn-lg', href: '#showcase', [.text(t(context, 'hero_cta_tour'))]),
          ]),
          div(classes: 'hero-highlights', [
            div(classes: 'highlight-item', [
              svg(
                viewBox: '0 0 24 24',
                attributes: {
                  'width': '20',
                  'height': '20',
                  'fill': 'none',
                  'stroke': 'currentColor',
                  'stroke-width': '2',
                },
                [
                  path(d: 'M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z', []),
                ],
              ),
              span([.text(t(context, 'hero_highlight_1'))]),
            ]),
            div(classes: 'highlight-item', [
              svg(
                viewBox: '0 0 24 24',
                attributes: {
                  'width': '20',
                  'height': '20',
                  'fill': 'none',
                  'stroke': 'currentColor',
                  'stroke-width': '2',
                },
                [
                  path(d: 'M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z', []),
                  polyline(points: '14 2 14 8 20 8', []),
                  line(x1: '16', y1: '13', x2: '8', y2: '13', []),
                  line(x1: '16', y1: '17', x2: '8', y2: '17', []),
                  polyline(points: '10 9 9 9 8 9', []),
                ],
              ),
              span([.text(t(context, 'hero_highlight_2'))]),
            ]),
            div(classes: 'highlight-item', [
              svg(
                viewBox: '0 0 24 24',
                attributes: {
                  'width': '20',
                  'height': '20',
                  'fill': 'none',
                  'stroke': 'currentColor',
                  'stroke-width': '2',
                },
                [
                  rect(x: '3', y: '11', width: '18', height: '11', rx: '2', ry: '2', []),
                  path(d: 'M7 11V7a5 5 0 0 1 10 0v4', []),
                ],
              ),
              span([.text(t(context, 'hero_highlight_3'))]),
            ]),
          ]),
        ]),
        div(classes: 'hero-visual', [
          div(classes: 'phone-mockup', [
            img(
              id: 'hero-phone-img',
              classes: 'phone-screen',
              src: './assets/screenshots/01_dashboard.png',
              alt: 'Coinky App Dashboard',
            ),
            div(classes: 'phone-glow', []),
          ]),
        ]),
      ]),
    ]);
  }
}
