import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynjio/screens/UserProductScreen.dart';
import 'package:mynjio/screens/product_overview_screen.dart';
import 'package:mynjio/screens/orders.dart' as ord_screen;

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Mynjio'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (ctx) => ProductOverviewScreen(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (ctx) => ord_screen.OrderScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage products'),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (ctx) => UserProductScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
