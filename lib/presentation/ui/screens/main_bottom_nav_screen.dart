import 'package:flutter/material.dart';
import '../utility/app_colors.dart';
import 'carts_list_screen.dart';
import 'category_screen.dart';
import 'home_screen.dart';
import 'wish_list_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int _selectedIndex = 0;
  final List<Widget> _screens = const[
    HomeScreen(),
    CategoryScreen(),
    CartsScreen(),
    WishListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap:(index) {
          _selectedIndex = index;
          if(mounted){
            setState(() {

            });
          }
        },
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.blue,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carts'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'WishList'),
        ],
      ),
    );
  }
}
