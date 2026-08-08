# coinky-web (Jaspr)

The Coinky marketing site, built with [Jaspr](https://jaspr.site) (the Dart
web framework).

Rendering mode: **static site generation** (`jaspr: mode: static` in
`pubspec.yaml`) — `jaspr build` produces plain static HTML/CSS/JS with no
server required at runtime.

## Project layout

- `web/style.css` — site stylesheet.
- `web/app_icon.png`, `web/coinky_logo.png`, `web/coinky_logo.svg`,
  `web/assets/screenshots/*.png` — static assets.
- `lib/i18n/translations.dart` — translations (`Map<String,
  Map<String, dynamic>>`, keys `en`/`pt`/`es`, including the nested
  `showcase_data` map).
- `lib/i18n/i18n_state.dart` — the shared reactive language/theme state
  (see doc comment at the top of that file for the full pattern and usage
  examples). Import `lib/i18n/i18n.dart` (barrel) from consuming code.
- `lib/app.dart` — root `App` component (the only `@client` component in
  the app).
- `lib/sections/` — page sections composed by `App`: navbar, hero,
  features grid, showcase, FAQ, CTA, and footer, plus the interactive
  islands (theme toggle, language select, showcase tabs, FAQ accordion).
- `lib/main.server.dart` / `lib/main.client.dart` — SSG entrypoints, wire
  up `Document` (title, meta description, font preconnects, `style.css`
  link) and mount `App`.

## Running the project

Run your project using `jaspr serve`.

The development server will be available on `http://localhost:8080`.

## Building the project

Build your project using `jaspr build`.

The output will be located inside the `build/jaspr/` directory.
