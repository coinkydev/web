import 'dart:io';

import 'package:coinky_web/i18n/i18n_state.dart';
import 'package:coinky_web/i18n/translations.dart';

void main() {
  stdout.writeln('Checking translations for missing / untranslated keys...');

  final baseMap = translations[defaultLanguage];
  if (baseMap == null) {
    stderr.writeln('ERROR: Base language "$defaultLanguage" not found in translations.');
    exit(1);
  }

  bool hasError = false;

  for (final lang in supportedLanguages) {
    if (lang == defaultLanguage) continue;

    final langMap = translations[lang];
    if (langMap == null) {
      stderr.writeln('❌ Language "$lang" is missing from translations map entirely.');
      hasError = true;
      continue;
    }

    final missingKeys = <String>[];
    final emptyKeys = <String>[];

    for (final entry in baseMap.entries) {
      final key = entry.key;
      final baseVal = entry.value;

      if (!langMap.containsKey(key)) {
        missingKeys.add(key);
        continue;
      }

      final langVal = langMap[key];

      if (baseVal is String) {
        if (langVal is! String || langVal.trim().isEmpty) {
          emptyKeys.add(key);
        }
      } else if (baseVal is Map<String, dynamic>) {
        if (langVal is! Map<String, dynamic>) {
          missingKeys.add('$key (expected Map structure)');
          continue;
        }

        // Validate showcase_data structure subkeys
        for (final subEntry in baseVal.entries) {
          final subKey = subEntry.key;
          final baseSubObj = subEntry.value;
          final langSubObj = langVal[subKey];

          if (langSubObj == null) {
            missingKeys.add('$key.$subKey');
            continue;
          }

          if (baseSubObj is Map<String, dynamic> && langSubObj is Map<String, dynamic>) {
            for (final field in baseSubObj.keys) {
              if (!langSubObj.containsKey(field)) {
                missingKeys.add('$key.$subKey.$field');
              }
            }
          }
        }
      }
    }

    if (missingKeys.isNotEmpty || emptyKeys.isNotEmpty) {
      hasError = true;
      stderr.writeln('\n❌ Language "$lang" has translation issues:');
      if (missingKeys.isNotEmpty) {
        stderr.writeln('  Missing keys (${missingKeys.length}):');
        for (final k in missingKeys) {
          stderr.writeln('    - $k');
        }
      }
      if (emptyKeys.isNotEmpty) {
        stderr.writeln('  Empty keys (${emptyKeys.length}):');
        for (final k in emptyKeys) {
          stderr.writeln('    - $k');
        }
      }
    } else {
      stdout.writeln('✓ Language "$lang": all ${baseMap.length} keys verified.');
    }
  }

  if (hasError) {
    stderr.writeln('\nTranslation verification failed!');
    exit(1);
  } else {
    stdout.writeln('\nAll translations are up to date and verified successfully!');
  }
}
