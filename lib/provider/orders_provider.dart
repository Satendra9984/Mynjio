import 'package:flutter/foundation.dart';
import 'package:mynjio/provider/cart_product.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> cartProducts;
  final DateTime dateTime;

  OrderItem({
    required this.dateTime,
    required this.id,
    required this.amount,
    required this.cartProducts,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> productList, double amount) {
    _orders.insert(
      0,
      OrderItem(
          dateTime: DateTime.now(),
          id: DateTime.now().toString(),
          amount: amount,
          cartProducts: productList),
    );
    notifyListeners();
  }
}
