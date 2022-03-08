import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mynjio/widgets/cart_item.dart';
import '../provider/orders_provider.dart' as ord_item;
import 'package:intl/intl.dart';

class OrdersItem extends StatefulWidget {
  final ord_item.OrderItem order;
  const OrdersItem({Key? key, required this.order}) : super(key: key);

  @override
  State<OrdersItem> createState() => _OrdersItemState();
}

class _OrdersItemState extends State<OrdersItem> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final cartProv = widget.order.cartProducts.toList();

    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              '\$${widget.order.amount}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '\$${DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime)}',
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: Icon(
                !isVisible
                    ? Icons.keyboard_arrow_down_outlined
                    : Icons.keyboard_arrow_up,
              ),
            ),
          ),
          if (isVisible)
            Container(
              padding: const EdgeInsets.all(10),
              height: min(cartProv.length * 10 + 100, 100),
              child: ListView(
                children: widget.order.cartProducts
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${e.quantity}x \$${e.price}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
// id: cartProv.items.values.toList()[index].id,
// productId: cartProv.items.keys.toList()[index],
// title: cartProv.items.values.toList()[index].title,
// price: cartProv.items.values.toList()[index].price,
// quantity: cartProv.items.values.toList()[index].quantity),
