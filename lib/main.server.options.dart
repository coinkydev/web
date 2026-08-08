// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:coinky_web/sections/form_section.dart' as _form_section;
import 'package:coinky_web/sections/privacy_policy.dart' as _privacy_policy;
import 'package:coinky_web/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _app.App: ClientTarget<_app.App>('app'),
    _form_section.FormSection: ClientTarget<_form_section.FormSection>(
      'form_section',
    ),
    _privacy_policy.PrivacyPolicy: ClientTarget<_privacy_policy.PrivacyPolicy>(
      'privacy_policy',
    ),
  },
);
