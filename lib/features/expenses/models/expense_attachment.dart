/// ---------------------------------------------------------------------------
/// ExpenseAttachment
/// ---------------------------------------------------------------------------
///
/// Represents a document attached to an expense.
///
/// Examples:
/// • Receipt
/// • Invoice
/// • Delivery Note
/// • Payment Slip
/// • Warranty
/// • Other Supporting Documents
/// ---------------------------------------------------------------------------
class ExpenseAttachment {
  const ExpenseAttachment({
    this.id,
    required this.fileName,
    required this.filePath,
    required this.fileType,
    this.fileSize = 0,
    this.uploadedAt,
  });

  //---------------------------------------------------------------------------
  // Identity
  //---------------------------------------------------------------------------

  final String? id;

  //---------------------------------------------------------------------------
  // File Information
  //---------------------------------------------------------------------------

  final String fileName;

  final String filePath;

  /// Example:
  /// pdf
  /// jpg
  /// png
  /// jpeg
  final String fileType;

  /// File size in bytes.
  final int fileSize;

  //---------------------------------------------------------------------------
  // Metadata
  //---------------------------------------------------------------------------

  final DateTime? uploadedAt;

  //---------------------------------------------------------------------------
  // Computed Properties
  //---------------------------------------------------------------------------

  bool get isImage {
    return fileType.toLowerCase() == 'jpg' ||
        fileType.toLowerCase() == 'jpeg' ||
        fileType.toLowerCase() == 'png';
  }

  bool get isPdf => fileType.toLowerCase() == 'pdf';

  bool get hasAttachment => filePath.trim().isNotEmpty;

  double get sizeInKB => fileSize / 1024;

  double get sizeInMB => fileSize / (1024 * 1024);

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  ExpenseAttachment copyWith({
    String? id,
    String? fileName,
    String? filePath,
    String? fileType,
    int? fileSize,
    DateTime? uploadedAt,
  }) {
    return ExpenseAttachment(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
      fileType: fileType ?? this.fileType,
      fileSize: fileSize ?? this.fileSize,
      uploadedAt: uploadedAt ?? this.uploadedAt,
    );
  }
}
