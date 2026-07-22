import 'package:flutter/material.dart';

class CustomerSelector extends StatelessWidget {
  const CustomerSelector({
    super.key,
    this.customerName,
    this.customerPhone,
    required this.onTap,
    this.onClear,
  });

  final String? customerName;
  final String? customerPhone;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  bool get _hasCustomer =>
      customerName != null && customerName!.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                child: Icon(
                  _hasCustomer
                      ? Icons.person
                      : Icons.person_outline,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      _hasCustomer
                          ? customerName!
                          : 'Walk-in Customer',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium,
                    ),

                    if (_hasCustomer &&
                        customerPhone != null &&
                        customerPhone!.isNotEmpty)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4),
                        child: Text(
                          customerPhone!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall,
                        ),
                      ),
                  ],
                ),
              ),

              if (_hasCustomer && onClear != null)
                IconButton(
                  tooltip: 'Clear Customer',
                  icon: const Icon(Icons.close),
                  onPressed: onClear,
                )
              else
                const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}