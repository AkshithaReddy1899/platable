import 'package:flutter/material.dart';

import '../../models/product_list_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Products> _cartItems = [];
  int totalPrice = 0;

  List<Products> get cartItems => _cartItems;

  void addItemToCart(item) {
    final index = cartItems.indexWhere((element) => element.id == item.id);
    if (index >= 0) {
      cartItems[index].quantity = cartItems[index].quantity! + 1;
    } else {
      cartItems.add(item);
    }
    getTotalAmount();
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  void deleteItemFromCart(item) {
    final index = cartItems.indexWhere((element) => element.id == item.id);
    cartItems.removeAt(index);
    getTotalAmount();
    notifyListeners();
  }

  void increaseQuantity(Products item) {
    item.quantity = item.quantity! + 1;
    getTotalAmount();
    notifyListeners();
  }

  void decreaseQuantity(Products item) {
    if (item.quantity! > 1) {
      item.quantity = item.quantity! - 1;
    } else {
      deleteItemFromCart(item);
    }
    getTotalAmount();
    notifyListeners();
  }

  void getTotalAmount() {
    int price = 0;
    for (var i = 0; i < cartItems.length; i++) {
      price = price + cartItems[i].todayPrice! * cartItems[i].quantity!;
    }
    totalPrice = price;
    notifyListeners();
  }
}
