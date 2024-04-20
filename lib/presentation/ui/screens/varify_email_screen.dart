import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';

class VerifiEmailScreen extends StatefulWidget {
  const VerifiEmailScreen({super.key});

  @override
  State<VerifiEmailScreen> createState() => _VerifiEmailScreenState();
}

class _VerifiEmailScreenState extends State<VerifiEmailScreen> {
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
                  child: ElevatedButton(onPressed: (){}, child: Text('Next'),))
            ],
          ),
        ),
      ),
    );
  }
}
