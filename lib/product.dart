import 'package:flutter/material.dart';
import 'productDetails.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List<Product> products=[
    Product(id:1, name: 'Product1', description:'This is some description for product 1'),
    Product(id:2, name: 'Product2', description:'This is some description for product 2'),
    Product(id:3, name: 'Product3', description:'This is some description for product 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index) {
          return ListTile(
            title: Text(products[index].name),
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> ProductDetails(product:products[index]),)
              );
            }
          );
        },
      ),
    );
  }
}

class Product{
  final int id;
  final String name,description;
  Product({required this.id, required this.name, required this.description});
}