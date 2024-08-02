import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/model/home_model.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? 'Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network("${product.thumbnail}"),
              const SizedBox(height: 16.0),
              Text(
                "${product.title}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                '\$ ${product.price}',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8.0),
              Text(
                "${product.description}",
                style: TextStyle(fontSize: 16),
              ),
              // Add more details as needed
            ],
          ),
        ),
      ),
    );
  }
}
