import 'package:flutter/foundation.dart';

/// ---------------------------------------------------------------------------
/// CustomerController
/// ---------------------------------------------------------------------------
///
/// Manages the selected customer for a sale.
///
/// Responsibilities:
/// • Select customer
/// • Clear customer
/// • Expose customer information
/// • Support walk-in customers
/// ---------------------------------------------------------------------------
class CustomerController extends ChangeNotifier {
  String? _customerId;
  String? _customerName;
  String? _customerPhone;

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  String? get customerId => _customerId;

  String? get customerName => _customerName;

  String? get customerPhone => _customerPhone;

  bool get hasCustomer =>
      _customerId != null ||
      (_customerName != null &&
          _customerName!.trim().isNotEmpty);

  bool get isWalkInCustomer => !hasCustomer;

  String get displayName =>
      hasCustomer ? _customerName! : 'Walk-in Customer';

  //---------------------------------------------------------------------------
  // Operations
  //---------------------------------------------------------------------------

  void selectCustomer({
    required String id,
    required String name,
    String? phone,
  }) {
    _customerId = id;
    _customerName = name;
    _customerPhone = phone;

    notifyListeners();
  }

  void updatePhone(String? phone) {
    _customerPhone = phone;
    notifyListeners();
  }

  void clearCustomer() {
    _customerId = null;
    _customerName = null;
    _customerPhone = null;

    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Future Integrations
  //---------------------------------------------------------------------------

  /// Opens the customer picker.
  ///
  /// This is a placeholder until the Customer module is implemented.
  Future<void> pickCustomer() async {
    // TODO:
    // Open Customer Search Screen
    // Return selected customer
  }

  /// Creates a new customer.
  ///
  /// Placeholder for future implementation.
  Future<void> createCustomer() async {
    // TODO:
    // Navigate to Create Customer Screen
  }
}