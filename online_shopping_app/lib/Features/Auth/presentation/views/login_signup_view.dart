import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/Core/utils/assets.dart';
import 'package:online_shopping_app/Core/widgets/custom_main_button.dart';
import 'package:online_shopping_app/Features/Auth/presentation/views/login_view.dart';
import 'package:online_shopping_app/Features/Auth/presentation/views/sign_up_view.dart';
import 'package:online_shopping_app/constants.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class LoginSignUpView extends StatelessWidget {
  const LoginSignUpView({super.key});
  static const String routeName = "LoginSignUpView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Image.asset(
                AssetsData.logo,
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: Text(
                "Enter your registered ",
                style: GoogleFonts.montserrat(
                  color: Constants.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              "Phone Number to Sign Up",
              style: GoogleFonts.montserrat(
                  color: Constants.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 64, bottom: 16),
              child: CustomMainButton(
                text: "Sign Up",
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(name: SignUpView.routeName),
                    screen: const SignUpView(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I already have an account? ",
                  style: GoogleFonts.montserrat(
                      color: Constants.greyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: LogInView.routeName),
                      screen: const LogInView(),
                      withNavBar: true,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                      color: Constants.secoundColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 62,
                    height: 1,
                    color: const Color(0xFF252836),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Or Sign up with",
                      style: GoogleFonts.montserrat(
                        color: Constants.greyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: 62,
                    height: 1,
                    color: const Color(0xFF252836),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF3F8FB),
                      borderRadius: BorderRadius.circular(360)),
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Image.asset(
                      AssetsData.google,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: const Color(0xFF252836),
                          borderRadius: BorderRadius.circular(360)),
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Image.asset(
                          AssetsData.apple,
                          width: 24,
                          height: 24,
                        ),
                      )),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: const Color(0xFF4267B2),
                      borderRadius: BorderRadius.circular(360)),
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Image.asset(
                      AssetsData.facebook,
                      width: 24,
                      height: 24,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
