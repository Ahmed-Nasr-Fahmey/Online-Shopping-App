import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_app/Core/utils/assets.dart';
import 'package:online_shopping_app/Features/Auth/presentation/views/login_signup_view.dart';
import 'package:online_shopping_app/constants.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 1200,
        splashIconSize: 300,
        splash: Image.asset(
          AssetsData.logo,
          width: MediaQuery.of(context).size.width,
        ),
        nextScreen: const LoginSignUpView(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
