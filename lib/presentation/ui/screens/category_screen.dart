import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading : const IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {

          },
        ),
        title : const Text('Category',style: TextStyle(
          fontSize: 18
        ),)
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount,
      ),
    );
  }
}