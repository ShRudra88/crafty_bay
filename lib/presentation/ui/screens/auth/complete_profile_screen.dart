import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/app_logo.dart';
import '../main_bottom_nav_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40,),
              const AppLogo(
                height: 88,
              ),
              const SizedBox(height: 24,),
              Text('Complete Profile',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 28,
              ),),
              Text('Get started with us with your address',
              style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 24,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'First Name'
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Last Name'
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Mobile',
                ),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),TextFormField(
                decoration: const InputDecoration(
                    hintText: 'City'
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Address',
                ),
                textInputAction: TextInputAction.done,
                maxLines: 4,
              ),
              const SizedBox(height: 16,),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Get.to(const MainBottomNavScreen());
                  }, child: const Text('Complete'),))
            ],
          ),
        ),
      ),
    );
  }
}
