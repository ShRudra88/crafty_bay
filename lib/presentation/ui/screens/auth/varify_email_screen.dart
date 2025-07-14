import 'package:e_commerce_flutter_crafty_bay/presentation/ui/screens/auth/varify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_logo.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 180,),
              const AppLogo(
                height: 88,
              ),
              const SizedBox(height: 24,),
              Text('Welcome back',style: Theme.of(context).textTheme.titleLarge,),
              Text('Please enter your email address',
              style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 24,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email'
                ),
              ),
              const SizedBox(height: 24,),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Get.to(const VerifyOtpScreen());
                  }, child: const Text('Next'),))
            ],
          ),
        ),
      ),
    );
  }
}
