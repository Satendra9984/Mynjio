import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynjio/provider/product.dart';
import 'package:mynjio/provider/productsProvider.dart';
import 'package:mynjio/screens/edit_product_screen.dart';
import 'package:mynjio/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Product Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (ctx) => EditProductScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (ctx, index) => UserProductItem(
                id: productData.items[index].id,
                title: productData.items[index].title,
                imageUrl: productData.items[index].imageUrl)),
      ),
    );
  }
}
