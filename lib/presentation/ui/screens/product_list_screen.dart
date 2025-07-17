import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/product_controller.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.category, this.categoryId});

  final String? category;
  final int? categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category ?? 'Products'),
      ),
      body : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GetBuilder<ProductController>(builder: (productController){
          return Visibility(
            visible: productController.inProgress == false, child: null,;
            replacement: CenterCircularProgressIndicator(),
          )
        }),
      ),
    );
  }
}
