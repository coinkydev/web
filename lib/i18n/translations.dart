import 'locales/en.dart';
import 'locales/es.dart';
import 'locales/pt.dart';

/// Combined translation registry mapping language codes (`en`, `pt`, `es`)
/// to their respective translation maps defined in `lib/i18n/locales/`.
const Map<String, Map<String, dynamic>> translations = {
  'en': enTranslations,
  'pt': ptTranslations,
  'es': esTranslations,
};
