import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// AddressInformationCard
/// ---------------------------------------------------------------------------
///
/// Supplier address information.
///
/// Used by:
/// • Add Supplier
/// • Edit Supplier
/// ---------------------------------------------------------------------------
class AddressInformationCard extends StatelessWidget {
  const AddressInformationCard({
    super.key,
    required this.countryController,
    required this.countyController,
    required this.cityController,
    required this.postalCodeController,
    required this.streetController,
    required this.buildingController,
    required this.landmarkController,
  });

  final TextEditingController countryController;
  final TextEditingController countyController;
  final TextEditingController cityController;
  final TextEditingController postalCodeController;
  final TextEditingController streetController;
  final TextEditingController buildingController;
  final TextEditingController landmarkController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Country
            //------------------------------------------------------------------
            TextFormField(
              controller: countryController,
              decoration: const InputDecoration(
                labelText: 'Country',
                prefixIcon: Icon(Icons.public),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // County
            //------------------------------------------------------------------
            TextFormField(
              controller: countyController,
              decoration: const InputDecoration(
                labelText: 'County / State',
                prefixIcon: Icon(Icons.map_outlined),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // City
            //------------------------------------------------------------------
            TextFormField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'City / Town',
                prefixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Postal Code
            //------------------------------------------------------------------
            TextFormField(
              controller: postalCodeController,
              decoration: const InputDecoration(
                labelText: 'Postal Code',
                prefixIcon: Icon(Icons.markunread_mailbox),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Street
            //------------------------------------------------------------------
            TextFormField(
              controller: streetController,
              decoration: const InputDecoration(
                labelText: 'Street',
                prefixIcon: Icon(Icons.signpost_outlined),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Building
            //------------------------------------------------------------------
            TextFormField(
              controller: buildingController,
              decoration: const InputDecoration(
                labelText: 'Building',
                prefixIcon: Icon(Icons.apartment),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Landmark
            //------------------------------------------------------------------
            TextFormField(
              controller: landmarkController,
              decoration: const InputDecoration(
                labelText: 'Landmark',
                hintText: 'Optional nearby landmark',
                prefixIcon: Icon(Icons.place_outlined),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
