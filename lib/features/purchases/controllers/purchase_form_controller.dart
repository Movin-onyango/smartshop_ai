import 'package:flutter/material.dart';

import '../models/purchase.dart';
import '../models/purchase_item.dart';
import '../models/purchase_status.dart';

/// ---------------------------------------------------------------------------
/// PurchaseFormController
/// ---------------------------------------------------------------------------
///
/// Manages:
/// • Create Purchase
/// • Edit Purchase
/// ---------------------------------------------------------------------------
class PurchaseFormController extends ChangeNotifier {
  //---------------------------------------------------------------------------
  // Form Key
  //---------------------------------------------------------------------------

  final formKey = GlobalKey<FormState>();

  //---------------------------------------------------------------------------
  // Controllers
  //---------------------------------------------------------------------------

  final supplierController = TextEditingController();

  final notesController = TextEditingController();

  //---------------------------------------------------------------------------
  // Fields
  //---------------------------------------------------------------------------

  String? supplierId;

  DateTime orderDate = DateTime.now();

  DateTime? expectedDeliveryDate;

  PurchaseStatus status = PurchaseStatus.draft;

  final List<PurchaseItem> items = [];

  //---------------------------------------------------------------------------
  // Constructors
  //---------------------------------------------------------------------------

  PurchaseFormController();

  PurchaseFormController.fromPurchase(Purchase purchase) {
    supplierId = purchase.supplierId;

    supplierController.text = purchase.supplierName;

    notesController.text = purchase.notes ?? '';

    orderDate = purchase.orderDate;

    expectedDeliveryDate = purchase.expectedDeliveryDate;

    status = purchase.status;

    items.addAll(purchase.items);
  }

  //---------------------------------------------------------------------------
  // Supplier
  //---------------------------------------------------------------------------

  void setSupplier({required String id, required String name}) {
    supplierId = id;
    supplierController.text = name;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Dates
  //---------------------------------------------------------------------------

  void setOrderDate(DateTime value) {
    orderDate = value;
    notifyListeners();
  }

  void setExpectedDeliveryDate(DateTime value) {
    expectedDeliveryDate = value;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Status
  //---------------------------------------------------------------------------

  void setStatus(PurchaseStatus value) {
    status = value;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Items
  //---------------------------------------------------------------------------

  void addItem(PurchaseItem item) {
    items.add(item);
    notifyListeners();
  }

  void updateItem(int index, PurchaseItem item) {
    items[index] = item;
    notifyListeners();
  }

  void removeItem(PurchaseItem item) {
    items.remove(item);
    notifyListeners();
  }

  void clearItems() {
    items.clear();
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Totals
  //---------------------------------------------------------------------------

  double get subtotal => items.fold(0.0, (sum, item) => sum + item.subtotal);

  double get totalDiscount =>
      items.fold(0.0, (sum, item) => sum + item.discountAmount);

  double get totalTax => items.fold(0.0, (sum, item) => sum + item.taxAmount);

  double get grandTotal => items.fold(0.0, (sum, item) => sum + item.total);

  //---------------------------------------------------------------------------
  // Validation
  //---------------------------------------------------------------------------

  bool validate() {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    if (supplierId == null) {
      return false;
    }

    if (items.isEmpty) {
      return false;
    }

    return true;
  }

  //---------------------------------------------------------------------------
  // Conversion
  //---------------------------------------------------------------------------

  Purchase toPurchase({String? id, String? purchaseNumber}) {
    return Purchase(
      id: id,

      purchaseNumber:
          purchaseNumber ?? 'PO-${DateTime.now().millisecondsSinceEpoch}',

      supplierId: supplierId!,

      supplierName: supplierController.text.trim(),

      orderDate: orderDate,

      expectedDeliveryDate: expectedDeliveryDate,

      status: status,

      notes: notesController.text.trim().isEmpty
          ? null
          : notesController.text.trim(),

      items: List.from(items),

      createdAt: DateTime.now(),

      updatedAt: DateTime.now(),
    );
  }

  //---------------------------------------------------------------------------
  // Dispose
  //---------------------------------------------------------------------------

  @override
  void dispose() {
    supplierController.dispose();
    notesController.dispose();
    super.dispose();
  }
}
