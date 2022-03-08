import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynjio/provider/product.dart';
import 'package:mynjio/screens/product_details.dart';
import 'package:provider/provider.dart';

import '../provider/cart_product.dart';

class ProductItem extends StatelessWidget {
  // final String imageUrl;
  // final String title;
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product productCon = Provider.of<Product>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (BuildContext context) => const ProductDetail(),
                settings: RouteSettings(
                    name: 'id', arguments: productCon.id.toString())),
          ),
          child: Image.network(
            productCon.imageUrl,
            // 'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              color: Theme.of(context).primaryColor,
              icon: Icon(productCon.isFavourite
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                // will do something
                productCon.toggleFavourite();
              },
            ),
          ),
          title: Text(
            productCon.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            color: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // adding product to the cart
              cart.addProduct(
                  productCon.id, productCon.title, 1, productCon.price);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added'),
                  backgroundColor: Colors.black54,
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleCartItem(productCon.id);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
