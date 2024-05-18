

import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
          title: const Text(
            'CATEGORY',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: AppColors.primaryColor),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryController>().getCategoryList();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                GetBuilder<CategoryController>(builder: (categoryController) {
              return Visibility(
                visible: categoryController.inProgress == false,
                replacement: CenterCircularProgressIndicator(),
                child: GridView.builder(
                    itemCount: categoryController
                            .categoryListModel?.categoryListItem?.length ??
                        0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.95,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                          child: CategoryItem(
                        categoryListItem: categoryController
                            .categoryListModel.categoryListItem![index],
                      ));
                    }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
