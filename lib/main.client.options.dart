// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:coinky_web/sections/form_section.dart'
    deferred as _form_section;
import 'package:coinky_web/sections/privacy_policy.dart'
    deferred as _privacy_policy;
import 'package:coinky_web/app.dart' deferred as _app;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'app': ClientLoader((p) => _app.App(), loader: _app.loadLibrary),
    'form_section': ClientLoader(
      (p) => _form_section.FormSection(),
      loader: _form_section.loadLibrary,
    ),
    'privacy_policy': ClientLoader(
      (p) => _privacy_policy.PrivacyPolicy(),
      loader: _privacy_policy.loadLibrary,
    ),
  },
);
