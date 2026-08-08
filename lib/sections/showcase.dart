import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../i18n/i18n.dart';

class _Tab {
  const _Tab({required this.key, required this.labelKey, required this.image});

  final String key;
  final String labelKey;
  final String image;
}

const _tabs = [
  _Tab(key: '01', labelKey: 'showcase_tab_1', image: './assets/screenshots/01_dashboard.png'),
  _Tab(key: '02', labelKey: 'showcase_tab_2', image: './assets/screenshots/02_cards.png'),
  _Tab(key: '03', labelKey: 'showcase_tab_3', image: './assets/screenshots/03_reports.png'),
  _Tab(key: '04', labelKey: 'showcase_tab_4', image: './assets/screenshots/04_settings.png'),
];

/// Interactive app showcase: tab switcher over screenshots, driven by local
/// state for the active tab and [I18nScope] for the translated content.
class Showcase extends StatefulComponent {
  const Showcase({super.key});

  @override
  State<Showcase> createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  String _activeKey = _tabs.first.key;

  @override
  Component build(BuildContext context) {
    final activeTab = _tabs.firstWhere((tab) => tab.key == _activeKey);
    final data = showcaseData(context, _activeKey);

    return section(id: 'showcase', classes: 'section showcase-section', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          h2(classes: 'section-title', [.text(t(context, 'showcase_title'))]),
          p(classes: 'section-subtitle', [.text(t(context, 'showcase_subtitle'))]),
        ]),
        div(
          classes: 'showcase-tabs',
          [
            for (final tab in _tabs)
              button(
                classes: tab.key == _activeKey ? 'tab-btn active' : 'tab-btn',
                onClick: () => setState(() => _activeKey = tab.key),
                [.text(t(context, tab.labelKey))],
              ),
          ],
        ),
        div(classes: 'showcase-stage', [
          div(classes: 'phone-mockup', [
            img(classes: 'phone-screen', src: activeTab.image, alt: 'Coinky App Interactive Preview'),
          ]),
          div(classes: 'showcase-details glass-card', [
            h3([.text(data['title'] as String)]),
            p([.text(data['desc'] as String)]),
            ul(
              classes: 'feature-list',
              [for (final item in data['list'] as List) li([.text(item as String)])],
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
