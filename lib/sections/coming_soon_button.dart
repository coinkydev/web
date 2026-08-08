import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../i18n/i18n.dart';

/// Reusable Coming Soon button component.
///
/// Wraps a button with a badge or coming-soon overlay/pill when [isComingSoon] is true.
/// Easily toggleable across the app for iOS or any future features/platforms.
class ComingSoonButton extends StatelessComponent {
  const ComingSoonButton({
    required this.label,
    required this.href,
    this.isComingSoon = true,
    this.classes = 'btn btn-primary btn-lg',
    this.badgeTextKey = 'coming_soon',
    this.icon,
    super.key,
  });

  final String label;
  final String href;
  final bool isComingSoon;
  final String classes;
  final String badgeTextKey;
  final Component? icon;

  @override
  Component build(BuildContext context) {
    if (!isComingSoon) {
      return a(classes: classes, href: href, [
        ?icon,
        span([.text(label)]),
      ]);
    }

    return div(classes: 'coming-soon-btn-wrapper', [
      a(classes: '$classes disabled coming-soon-btn', href: 'javascript:void(0)', [
        ?icon,
        span([.text(label)]),
        span(classes: 'coming-soon-badge', [.text(t(context, badgeTextKey))]),
      ]),
    ]);
  }
}
