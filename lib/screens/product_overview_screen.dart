import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynjio/screens/cart_screen.dart';
import 'package:mynjio/screens/products_grid.dart';
import 'package:mynjio/widgets/appdrawer.dart';
import 'package:provider/provider.dart';
import '../provider/cart_product.dart';
import '../widgets/badge.dart';

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool showFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if (value == 0) {
                  showFavourite = true;
                } else {
                  showFavourite = false;
                }
              });
            },
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                child: Text('Favourites'),
                value: 0,
              ),
              const PopupMenuItem(
                child: Text('All'),
                value: 1,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (ctx, cart, ch) => Badge(
              child: ch!,
              color: Colors.red,
              value: cart.cartLen.toString(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (ctx) => CartScreen()));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ProductsGrid(
        showFavourite: showFavourite,
      ),
    );
  }
}
