import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/app_colors.dart';
import '../../widgets/app_logo.dart';
import 'complete_profile_screen.dart';


class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late Timer _timer;
  int _countdown = 60;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              const AppLogo(
                height: 88,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Enter OTP code',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'A 4 digit OTP code has been sent',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 24,
              ),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.transparent,
                  inactiveFillColor: Colors.transparent,
                  inactiveColor: AppColors.primaryColor,
                  selectedColor: Colors.transparent,
                  selectedFillColor: Colors.purple,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                // onCompleted: (v) {
                //   print("Completed");
                // },
                appContext: context,
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const CompleteProfileScreen());
                  },
                  child: const Text('Next'),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  children: [
                    const TextSpan(
                      text: 'This code will expire in ',
                    ),
                    TextSpan(
                      text: '$_countdown s',
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (_countdown == 0)
                TextButton(
                  onPressed: () {
                    // Handle resend code logic here
                  },
                  child: const Text(
                    'Resend code',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )
              else
                const TextButton(
                  onPressed: null,
                  child: Text(
                    'Resend code',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
