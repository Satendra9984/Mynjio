import 'package:flutter/material.dart';
import 'package:mynjio/provider/productsProvider.dart';
import 'package:mynjio/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavourite;
  const ProductsGrid({
    Key? key,
    required this.showFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final productList =
        showFavourite == true ? productData.favouriteItem : productData.items;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GridView.builder(
        // padding: const EdgeInsets.all(10),
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: productList[index],
          child: ProductItem(),
        ),
      ),
    );
  }
}
