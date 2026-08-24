import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../i18n/i18n.dart';

class _ReportFeature {
  const _ReportFeature({
    required this.titleKey,
    required this.descKey,
    required this.icon,
  });

  final String titleKey;
  final String descKey;
  final Component icon;
}

final _reportFeatures = [
  _ReportFeature(
    titleKey: 'advanced_reports_card_1_title',
    descKey: 'advanced_reports_card_1_desc',
    icon: svg(
      viewBox: '0 0 24 24',
      attributes: {
        'width': '24',
        'height': '24',
        'fill': 'none',
        'stroke': 'currentColor',
        'stroke-width': '2',
      },
      [
        polyline(points: '23 6 13.5 15.5 8.5 10.5 1 18', []),
        polyline(points: '17 6 23 6 23 12', []),
      ],
    ),
  ),
  _ReportFeature(
    titleKey: 'advanced_reports_card_2_title',
    descKey: 'advanced_reports_card_2_desc',
    icon: svg(
      viewBox: '0 0 24 24',
      attributes: {
        'width': '24',
        'height': '24',
        'fill': 'none',
        'stroke': 'currentColor',
        'stroke-width': '2',
      },
      [
        line(x1: '18', y1: '20', x2: '18', y2: '10', []),
        line(x1: '12', y1: '20', x2: '12', y2: '4', []),
        line(x1: '6', y1: '20', x2: '6', y2: '14', []),
      ],
    ),
  ),
  _ReportFeature(
    titleKey: 'advanced_reports_card_3_title',
    descKey: 'advanced_reports_card_3_desc',
    icon: svg(
      viewBox: '0 0 24 24',
      attributes: {
        'width': '24',
        'height': '24',
        'fill': 'none',
        'stroke': 'currentColor',
        'stroke-width': '2',
      },
      [
        polyline(points: '23 4 23 10 17 10', []),
        polyline(points: '1 20 1 14 7 14', []),
        path(d: 'M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15', []),
      ],
    ),
  ),
  _ReportFeature(
    titleKey: 'advanced_reports_card_4_title',
    descKey: 'advanced_reports_card_4_desc',
    icon: svg(
      viewBox: '0 0 24 24',
      attributes: {
        'width': '24',
        'height': '24',
        'fill': 'none',
        'stroke': 'currentColor',
        'stroke-width': '2',
      },
      [
        path(d: 'M21.21 15.89A10 10 0 1 1 8 2.83', []),
        path(d: 'M22 12A10 10 0 0 0 12 2v10z', []),
      ],
    ),
  ),
  _ReportFeature(
    titleKey: 'advanced_reports_card_5_title',
    descKey: 'advanced_reports_card_5_desc',
    icon: svg(
      viewBox: '0 0 24 24',
      attributes: {
        'width': '24',
        'height': '24',
        'fill': 'none',
        'stroke': 'currentColor',
        'stroke-width': '2',
      },
      [
        path(d: 'M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4', []),
        polyline(points: '7 10 12 15 17 10', []),
        line(x1: '12', y1: '15', x2: '12', y2: '3', []),
      ],
    ),
  ),
];

/// Dedicated section highlighting Coinky's Advanced Reports capabilities:
/// Net Worth evolution, spending trends, recurring subscriptions, and expense classification.
class AdvancedReportsSection extends StatelessComponent {
  const AdvancedReportsSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'reports',
      classes: 'section advanced-reports-section',
      [
        div(classes: 'container', [
          div(classes: 'section-header text-center', [
            div(classes: 'badge-pill', [
              span(classes: 'badge-pulse', []),
              span([.text(t(context, 'advanced_reports_badge'))]),
            ]),
            h2(
              classes: 'section-title',
              attributes: {'style': 'margin-top: 16px;'},
              [.text(t(context, 'advanced_reports_title'))],
            ),
            p(
              classes: 'section-subtitle',
              [.text(t(context, 'advanced_reports_subtitle'))],
            ),
          ]),
          div(classes: 'advanced-reports-stage', [
            div(classes: 'advanced-reports-visual', [
              div(classes: 'phone-mockup', [
                img(
                  classes: 'phone-screen',
                  src: './assets/screenshots/04_advanced_reports.png',
                  alt: 'Coinky Advanced Reports & Analytics Preview',
                ),
                div(classes: 'phone-glow', []),
              ]),
            ]),
            div(classes: 'advanced-reports-features', [
              for (final feature in _reportFeatures)
                div(classes: 'report-feature-item glass-card', [
                  div(classes: 'report-feature-icon', [feature.icon]),
                  div(classes: 'report-feature-body', [
                    h3([.text(t(context, feature.titleKey))]),
                    p([.text(t(context, feature.descKey))]),
                  ]),
                ]),
            ]),
          ]),
        ]),
      ],
    );
  }
}
