import 'dart:io';

import 'package:share_plus/share_plus.dart';

/// ---------------------------------------------------------------------------
/// ExportShareHelper
/// ---------------------------------------------------------------------------
///
/// Opens the native share sheet.
/// ---------------------------------------------------------------------------
class ExportShareHelper {
  const ExportShareHelper._();

  static Future<void> share(
    File file,
  ) async {
    await Share.shareXFiles(
      [
        XFile(file.path),
      ],
    );
  }
}