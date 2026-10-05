import 'dart:js_interop';
import 'dart:js_interop_unsafe';

/// Calls `umami.track(name, data)` if the Umami script has loaded.
void trackEvent(String name, Map<String, String> data) {
  final umami = globalContext.getProperty<JSObject?>('umami'.toJS);
  umami?.callMethod('track'.toJS, name.toJS, data.jsify());
}
