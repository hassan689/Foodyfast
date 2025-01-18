import 'package:flutter/material.dart';
import 'food_item.dart'; 

class CartProvider with ChangeNotifier {
  final Map<String, FoodItem> _items = {};

  Map<String, FoodItem> get items => _items;

  double get totalAmount {
    return _items.values.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addItem(FoodItem foodItem) {
    if (_items.containsKey(foodItem.id)) {
      _items[foodItem.id]!.quantity++;
    } else {
      _items[foodItem.id] = foodItem;
    }
    notifyListeners();
  }

  void removeItem(String id) {
    if (_items.containsKey(id)) {
      _items.remove(id);
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
