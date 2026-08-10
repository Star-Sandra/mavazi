import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:mavazi/models/product.dart';
import 'package:mavazi/models/cart_item.dart';

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);
  double getTotalPrice() {
    double total = 0.0;
    _items.forEach((item) => total += item.itemTotal);
    return total;
  }


  CartItem? findItem(Product product) {
    //return _items.any((item) => item.product.name == product.name);
    for (var item in _items) {
      if (item.product.name == product.name) {
        return item; //.quantity > 0;
      }
    }
    return null;
  }

  void addItem(Product product) {
    var existingItem = findItem(product);
    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(Product product){
    _items.removeWhere((item) => item.product.name == product.name);
    notifyListeners();
  }

  void incrementQuantity(Product product) {
    var existingItem = findItem(product);
    if (existingItem != null) {
      existingItem.quantity++;
    }
    notifyListeners();    
  }

  void decrementQuantity(Product product) {
    var existingItem = findItem(product);
    if (existingItem == null) return;
    if (existingItem.quantity > 1) {
      existingItem.quantity--;
    } else{
      removeItem(product);
    }
    notifyListeners();
  }
}