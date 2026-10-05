/// Cookieless website analytics (Umami), see growth-plans/01-measurement.md.
///
/// The tracking script is only added to the page when the build is given
/// `--dart-define UMAMI_WEBSITE_ID=<id>` (set in CI from the repository
/// secret of the same name), so local builds never report anything.
///
/// Events must never carry personal data: only fixed names and short,
/// non-identifying properties such as `store: 'ios'`.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'track_event_stub.dart' if (dart.library.js_interop) 'track_event_web.dart' as impl;

const umamiWebsiteId = String.fromEnvironment('UMAMI_WEBSITE_ID');

/// `<script>` tags to add to the document head; empty when analytics is off.
List<Component> analyticsHead() => [
  if (umamiWebsiteId.isNotEmpty)
    script(
      src: 'https://cloud.umami.is/script.js',
      defer: true,
      attributes: {'data-website-id': umamiWebsiteId},
    ),
];

/// Reports a custom event. A no-op on the server, when analytics is off, or
/// when the script was blocked (e.g. by an ad blocker).
void trackEvent(String name, [Map<String, String> data = const {}]) {
  if (!kIsWeb || umamiWebsiteId.isEmpty) return;
  impl.trackEvent(name, data);
}
