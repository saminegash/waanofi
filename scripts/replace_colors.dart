import 'dart:io';

void main() async {
  final directory = Directory('lib');
  final files = directory.listSync(recursive: true).whereType<File>().where((f) => f.path.endsWith('.dart') && !f.path.contains('waanofi_colors.dart'));

  int replacedFiles = 0;

  for (final file in files) {
    String content = await file.readAsString();
    bool changed = false;

    // Mapping Colors.* to WaanofiColors.*
    final replacements = {
      'Colors.white': 'WaanofiColors.surface',
      'Colors.black': 'WaanofiColors.textPrimary',
      'Colors.grey.shade100': 'WaanofiColors.surfaceDark',
      'Colors.grey.shade200': 'WaanofiColors.outline',
      'Colors.grey.shade300': 'WaanofiColors.outlineDark',
      'Colors.grey': 'WaanofiColors.textSecondary',
      'Colors.red': 'WaanofiColors.error',
      'Colors.green': 'WaanofiColors.success',
      'Colors.blue': 'WaanofiColors.primary',
      'Colors.orange': 'WaanofiColors.warning',
      'Colors.transparent': 'const Color(0x00000000)',
    };

    replacements.forEach((key, value) {
      if (content.contains(key)) {
        content = content.replaceAll(key, value);
        changed = true;
      }
    });

    if (changed) {
      if (!content.contains('waanofi_colors.dart')) {
        // Need to add import
        // Find a good place to put it
        final importLine = "import 'package:waanofi/core/theme/waanofi_colors.dart';\n";
        content = importLine + content;
      }
      await file.writeAsString(content);
      replacedFiles++;
    }
  }

  print('Replaced colors in $replacedFiles files.');
}
