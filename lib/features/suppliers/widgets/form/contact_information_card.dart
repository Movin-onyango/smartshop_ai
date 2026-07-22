import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ContactInformationCard
/// ---------------------------------------------------------------------------
///
/// Supplier contact and business information.
///
/// Used by:
/// • Add Supplier
/// • Edit Supplier
/// ---------------------------------------------------------------------------
class ContactInformationCard extends StatelessWidget {
  const ContactInformationCard({
    super.key,
    required this.phoneController,
    required this.emailController,
    required this.taxNumberController,
    required this.paymentTermsController,
  });

  final TextEditingController phoneController;

  final TextEditingController emailController;

  final TextEditingController taxNumberController;

  final TextEditingController paymentTermsController;

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
              'Contact Information',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Phone Number
            //------------------------------------------------------------------

            TextFormField(
              controller: phoneController,
              keyboardType:
                  TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: '+254712345678',
                prefixIcon: Icon(
                  Icons.phone_outlined,
                ),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Email
            //------------------------------------------------------------------

            TextFormField(
              controller: emailController,
              keyboardType:
                  TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                hintText:
                    'supplier@example.com',
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Tax Number
            //------------------------------------------------------------------

            TextFormField(
              controller:
                  taxNumberController,
              decoration: const InputDecoration(
                labelText: 'Tax Number',
                hintText: 'KRA PIN / VAT No.',
                prefixIcon: Icon(
                  Icons.badge_outlined,
                ),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Payment Terms
            //------------------------------------------------------------------

            TextFormField(
              controller:
                  paymentTermsController,
              decoration: const InputDecoration(
                labelText: 'Payment Terms',
                hintText:
                    'Cash, 30 Days, 60 Days...',
                prefixIcon: Icon(
                  Icons.payments_outlined,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}