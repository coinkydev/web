import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../i18n/i18n.dart';

class _FeatureData {
  const _FeatureData({required this.titleKey, required this.descKey, required this.icon});

  final String titleKey;
  final String descKey;
  final Component icon;
}

final _features = [
  _FeatureData(
    titleKey: 'feature_1_title',
    descKey: 'feature_1_desc',
    icon: svg(
      viewBox: '0 0 24 24',
      attributes: {'width': '28', 'height': '28', 'fill': 'none', 'stroke': 'currentColor', 'stroke-width': '2'},
      [
        rect(x: '1', y: '4', width: '22', height: '16', rx: '2', ry: '2', []),
        line(x1: '1', y1: '10', x2: '23', y2: '10', []),
      ],
    ),
  ),
  _FeatureData(
    titleKey: 'feature_2_title',
    descKey: 'feature_2_desc',
    icon: svg(
      viewBox: '0 0 24 24',
      attributes: {'width': '28', 'height': '28', 'fill': 'none', 'stroke': 'currentColor', 'stroke-width': '2'},
      [
        path(d: 'M21.21 15.89A10 10 0 1 1 8 2.83', []),
        path(d: 'M22 12A10 10 0 0 0 12 2v10z', []),
      ],
    ),
  ),
  _FeatureData(
    titleKey: 'feature_3_title',
    descKey: 'feature_3_desc',
    icon: svg(
      viewBox: '0 0 24 24',
      attributes: {'width': '28', 'height': '28', 'fill': 'none', 'stroke': 'currentColor', 'stroke-width': '2'},
      [
        path(d: 'M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z', []),
        polyline(points: '14 2 14 8 20 8', []),
        line(x1: '12', y1: '18', x2: '12', y2: '12', []),
        line(x1: '9', y1: '15', x2: '15', y2: '15', []),
      ],
    ),
  ),
  _FeatureData(
    titleKey: 'feature_4_title',
    descKey: 'feature_4_desc',
    icon: svg(
      viewBox: '0 0 24 24',
      attributes: {'width': '28', 'height': '28', 'fill': 'none', 'stroke': 'currentColor', 'stroke-width': '2'},
      [
        path(d: 'M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9', []),
        path(d: 'M13.73 21a2 2 0 0 1-3.46 0', []),
      ],
    ),
  ),
  _FeatureData(
    titleKey: 'feature_5_title',
    descKey: 'feature_5_desc',
    icon: svg(
      viewBox: '0 0 24 24',
      attributes: {'width': '28', 'height': '28', 'fill': 'none', 'stroke': 'currentColor', 'stroke-width': '2'},
      [
        path(d: 'M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z', []),
      ],
    ),
  ),
  _FeatureData(
    titleKey: 'feature_6_title',
    descKey: 'feature_6_desc',
    icon: svg(
      viewBox: '0 0 24 24',
      attributes: {'width': '28', 'height': '28', 'fill': 'none', 'stroke': 'currentColor', 'stroke-width': '2'},
      [
        circle(cx: '12', cy: '12', r: '10', []),
        path(d: 'M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20', []),
        path(d: 'M2 12h20', []),
      ],
    ),
  ),
];

/// Features grid section.
class Features extends StatelessComponent {
  const Features({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'section features-section', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          h2(classes: 'section-title', [.text(t(context, 'features_title'))]),
          p(classes: 'section-subtitle', [.text(t(context, 'features_subtitle'))]),
        ]),
        div(
          classes: 'features-grid',
          [
            for (final feature in _features)
              div(classes: 'feature-card glass-card', [
                div(classes: 'feature-icon', [feature.icon]),
                h3([.text(t(context, feature.titleKey))]),
                p([.text(t(context, feature.descKey))]),
              ]),
          ],
        ),
      ]),
    ]);
  }
}
