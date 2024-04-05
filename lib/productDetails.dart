import 'package:flutter/material.dart';
import 'package:sample_practice/product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text('${product.name}'),
            SizedBox(height:30),
            Text('${product.description}')
          ],
        ),
      ),
    );
  }
}
