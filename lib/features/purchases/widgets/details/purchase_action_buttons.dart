import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// PurchaseActionButtons
/// ---------------------------------------------------------------------------
///
/// Reusable action buttons for the Purchase Details screen.
///
/// Used by:
/// • Purchase Details
/// ---------------------------------------------------------------------------
class PurchaseActionButtons extends StatelessWidget {
  const PurchaseActionButtons({
    super.key,
    this.onReceive,
    this.onEdit,
    this.onPrint,
    this.onShare,
    this.onGeneratePdf,
    this.onCancel,
    this.onDelete,
  });

  final VoidCallback? onReceive;
  final VoidCallback? onEdit;
  final VoidCallback? onPrint;
  final VoidCallback? onShare;
  final VoidCallback? onGeneratePdf;
  final VoidCallback? onCancel;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              'Actions',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton.icon(
                  onPressed: onReceive,
                  icon: const Icon(
                    Icons.inventory,
                  ),
                  label: const Text(
                    'Receive',
                  ),
                ),

                OutlinedButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit,
                  ),
                  label: const Text(
                    'Edit',
                  ),
                ),

                OutlinedButton.icon(
                  onPressed: onPrint,
                  icon: const Icon(
                    Icons.print,
                  ),
                  label: const Text(
                    'Print',
                  ),
                ),

                OutlinedButton.icon(
                  onPressed: onShare,
                  icon: const Icon(
                    Icons.share,
                  ),
                  label: const Text(
                    'Share',
                  ),
                ),

                OutlinedButton.icon(
                  onPressed:
                      onGeneratePdf,
                  icon: const Icon(
                    Icons.picture_as_pdf,
                  ),
                  label: const Text(
                    'PDF',
                  ),
                ),

                FilledButton.tonalIcon(
                  onPressed: onCancel,
                  icon: const Icon(
                    Icons.cancel,
                  ),
                  label: const Text(
                    'Cancel',
                  ),
                ),

                FilledButton.icon(
                  style:
                      FilledButton.styleFrom(
                    backgroundColor:
                        Colors.red,
                    foregroundColor:
                        Colors.white,
                  ),
                  onPressed: () async {
                    final confirmed =
                        await showDialog<bool>(
                              context:
                                  context,
                              builder:
                                  (context) =>
                                      AlertDialog(
                                title:
                                    const Text(
                                  'Delete Purchase',
                                ),
                                content:
                                    const Text(
                                  'Are you sure you want to permanently delete this purchase?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () =>
                                            Navigator.pop(
                                      context,
                                      false,
                                    ),
                                    child:
                                        const Text(
                                      'Cancel',
                                    ),
                                  ),
                                  FilledButton(
                                    onPressed:
                                        () =>
                                            Navigator.pop(
                                      context,
                                      true,
                                    ),
                                    child:
                                        const Text(
                                      'Delete',
                                    ),
                                  ),
                                ],
                              ),
                            ) ??
                            false;

                    if (confirmed) {
                      onDelete?.call();
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                  label: const Text(
                    'Delete',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}