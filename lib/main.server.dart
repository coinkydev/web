/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

// Imports the [App] component.
import 'app.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Starts the app.
  //
  // [Document] renders the root document structure (<html>, <head> and <body>)
  // with the provided parameters and components.
  //
  // The `lang`/`class` attributes on `<html>` are NOT set here — they are
  // set reactively from `App` via `Document.html(...)` (see lib/app.dart)
  // so they can respond to language/theme state changes.
  runApp(
    Document(
      title: 'Coinky | Privacy-First Personal Finance & Expense Tracker',
      meta: {
        'description':
            'Master your money with Coinky: an offline-first, privacy-focused personal finance app featuring OFX bank import, credit card bill cycles, budget alerts, and biometric lock.',
      },
      head: [
        // Google Fonts preconnect + stylesheet, ported verbatim from index.html.
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: {'crossorigin': ''}),
        link(
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap',
        ),
        // Site stylesheet, copied verbatim from the original site (do not edit inline;
        // edit web/style.css instead, kept in sync with ../style.css).
        link(rel: 'stylesheet', href: 'style.css'),
      ],
      body: App(),
    ),
  );
}
