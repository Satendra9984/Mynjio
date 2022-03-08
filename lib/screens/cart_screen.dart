// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mynjio/widgets/cart_item.dart' as ci;
import 'package:provider/provider.dart';

import '../provider/cart_product.dart' show Cart;
import '../provider/orders_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProv = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        // padding: const EdgeInsets.all(10),
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // Spacer(),
                  Chip(
                    label: Text('\$${cartProv.total.toStringAsFixed(2)}'),
                    backgroundColor: Colors.green[200],
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: ORDER NOW FUNCTIONALITY
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cartProv.items.values.toList(), cartProv.total);
                      cartProv.clearCart();
                    },
                    child: const Text(
                      'Order Now',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProv.items.length,
              itemBuilder: (ctx, index) => ci.CartItem(
                  id: cartProv.items.values.toList()[index].id,
                  productId: cartProv.items.keys.toList()[index],
                  title: cartProv.items.values.toList()[index].title,
                  price: cartProv.items.values.toList()[index].price,
                  quantity: cartProv.items.values.toList()[index].quantity),
            ),
          ),
        ],
      ),
    );
  }
}
