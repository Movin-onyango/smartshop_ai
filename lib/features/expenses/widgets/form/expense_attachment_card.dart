import 'package:flutter/material.dart';

import '../../models/expense_attachment.dart';

/// ---------------------------------------------------------------------------
/// ExpenseAttachmentCard
/// ---------------------------------------------------------------------------
///
/// Displays the selected attachment and provides actions
/// for adding or removing an attachment.
///
/// Used by:
/// • AddExpenseScreen
/// • EditExpenseScreen
/// ---------------------------------------------------------------------------
class ExpenseAttachmentCard extends StatelessWidget {
  const ExpenseAttachmentCard({
    super.key,
    required this.attachment,
    required this.onAttach,
    required this.onRemove,
  });

  final ExpenseAttachment? attachment;

  final VoidCallback onAttach;

  final VoidCallback onRemove;

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
              'Attachment',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            if (attachment == null)
              OutlinedButton.icon(
                onPressed: onAttach,
                icon: const Icon(
                  Icons.attach_file,
                ),
                label: const Text(
                  'Attach Receipt / Invoice',
                ),
              )
            else
              Container(
                padding:
                    const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context)
                        .dividerColor,
                  ),
                  borderRadius:
                      BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      attachment!.isPdf
                          ? Icons.picture_as_pdf
                          : Icons.image,
                      size: 40,
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Text(
                            attachment!
                                .fileName,
                            maxLines: 1,
                            overflow:
                                TextOverflow
                                    .ellipsis,
                            style: Theme.of(
                                    context)
                                .textTheme
                                .titleMedium,
                          ),

                          const SizedBox(
                            height: 4,
                          ),

                          Text(
                            '${attachment!.fileType.toUpperCase()} • '
                            '${attachment!.sizeInKB.toStringAsFixed(1)} KB',
                            style: Theme.of(
                                    context)
                                .textTheme
                                .bodySmall,
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      tooltip:
                          'Remove Attachment',
                      onPressed: onRemove,
                      icon: const Icon(
                        Icons.delete_outline,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}