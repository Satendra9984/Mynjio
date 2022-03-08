import 'package:flutter/foundation.dart';

// cart item data type
class CartItem with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.title,
    required this.id,
    required this.quantity,
    required this.price,
  });
}

// this class will manage all data related to cart items
class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get cartLen {
    return _items.length;
  }

  double get total {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  // function for adding cart items
  void addProduct(String id, String title, int quantity, double price) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (value) => CartItem(
            title: value.title,
            id: value.id,
            quantity: value.quantity + 1,
            price: value.price),
      );
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(title: title, id: id, quantity: quantity, price: price),
      );
    }
    notifyListeners();
  }

  void removeCartItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleCartItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }

    if (_items[id]!.quantity > 1) {
      _items.update(
          id,
          (value) => CartItem(
              title: value.title,
              id: value.id,
              quantity: value.quantity - 1,
              price: value.price));
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
