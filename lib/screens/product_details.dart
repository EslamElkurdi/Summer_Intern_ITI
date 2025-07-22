import 'package:flutter/material.dart';
import 'package:iti_flutter/models/product/product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title!)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(product.image!),
            SizedBox(height: 10),
            Text(
              product.title!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              '${product.price} \$',
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(child: SingleChildScrollView(
              child: Text(product.description!),
            ))
          ],
        ),
      ),
    );
  }
}
