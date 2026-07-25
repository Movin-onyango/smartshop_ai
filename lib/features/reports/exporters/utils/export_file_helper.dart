import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// ---------------------------------------------------------------------------
/// ExportFileHelper
/// ---------------------------------------------------------------------------
///
/// Saves exported reports into the application's documents directory.
/// ---------------------------------------------------------------------------
class ExportFileHelper {
  const ExportFileHelper._();

  static Future<File> createFile({
    required String fileName,
    required List<int> bytes,
  }) async {
    final directory =
        await getApplicationDocumentsDirectory();

    final file = File(
      '${directory.path}/$fileName',
    );

    return file.writeAsBytes(bytes);
  }
}