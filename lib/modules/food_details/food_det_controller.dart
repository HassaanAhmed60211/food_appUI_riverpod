import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackees/core/models/popular_items_model.dart';

final fdProvider =
    ChangeNotifierProvider<FoodDetailsProvider>((ref) => FoodDetailsProvider());

class FoodDetailsProvider extends ChangeNotifier {
  String selectedSize = 'S';
  int qty = 1;
  double price = 0.0;
  double totalPrice = 0.0;
  double subtotal = 0.0;
  double totalCart = 0.0;
  double discount = 0.0;

  TextEditingController cpnController = TextEditingController();

  List<PopularSingleItem> addItem = [];

  void appluCpnCode(String code) {
    code.toLowerCase();
    if (code == 'bbbb') {
      discount = 100;
    } else if (code == 'cccc') {
      discount = 200;
    }
    notifyListeners();
  }

  void increaseQty() {
    subtotal = 0.0;
    qty++;
    totalPrice = price * qty;
    notifyListeners();
  }

  void decreaseQty() {
    subtotal = 0.0;

    if (qty > 1) {
      qty--;
      totalPrice = price * qty;
    }

    notifyListeners();
  }

  void calSubTotal() {
    subtotal = 0.0;

    for (var element in addItem) {
      subtotal += element.price;
    }
    totalCart = subtotal + 98.0 - discount;
    notifyListeners();
  }

  void increaseQtyCart() {
    qty++;
    debugPrint(addItem.toString());
    notifyListeners();
  }

  void decreaseQtyCart() {
    if (qty > 1) {
      qty--;
    }

    notifyListeners();
  }

  void priceChanged() {
    totalPrice = price * qty;
    notifyListeners();
  }

  void selectSize(String val) {
    selectedSize = val;
    notifyListeners();
  }
}
