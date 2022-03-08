import 'package:flutter/material.dart';
import 'package:mynjio/widgets/appdrawer.dart';
import 'package:mynjio/widgets/order_item.dart';
import 'package:provider/provider.dart';
// import '../provider/orders_provider.dart' as ord;
import '../provider/orders_provider.dart' show Orders;

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, index) => OrdersItem(
          order: orderData.orders[index],
        ),
      ),
    );
  }
}
