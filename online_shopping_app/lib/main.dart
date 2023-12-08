import 'package:flutter/material.dart';
import 'package:online_shopping_app/Features/Splash/presentation/view/splash_view.dart';
import 'package:online_shopping_app/constants.dart';

void main() {
  runApp(const OnlineShoppingApp());
}

class OnlineShoppingApp extends StatelessWidget {
  const OnlineShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.primaryColor,
      ),
    );
  }
}
