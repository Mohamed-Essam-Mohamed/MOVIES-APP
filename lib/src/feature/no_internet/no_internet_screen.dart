import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  static const String routeName = 'NoInternetScreen';
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Can\'t connect .. check internet',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
              Image.asset('assets/svg_images/no_internet.png')
            ],
          ),
        ),
      ),
    );
    ;
  }
}
