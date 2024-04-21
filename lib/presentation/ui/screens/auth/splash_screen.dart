import 'package:crafty_bay/presentation/ui/screens/auth/varify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_logo.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 3),);
    Get.offAll(const VerifyEmailScreen());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 100,),
            Text('Version 1.0'),
            SizedBox(height: 100,),
          ],
        )
      ),
    );
  }
}
