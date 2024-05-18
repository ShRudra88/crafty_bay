import 'package:crafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'home_screen.dart';
import 'main_bottom_nav_screen.dart'; // Import your HomeScreen if it's in a separate file

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(const MainBottomNavScreen());
          },
        ),
        title: const Text(
          'Category',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              childAspectRatio: .9,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
            ),

            itemBuilder: (context, index){
            return const FittedBox(child: CategoryItem());
            }),
      )
    );
  }
}
