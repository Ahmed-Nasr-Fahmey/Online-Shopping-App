import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/Core/utils/functions/unfocus_text_fields.dart';
import 'package:online_shopping_app/Core/widgets/buttom_nav_bar.dart';
import 'package:online_shopping_app/Core/widgets/custom_app_bar.dart';
import 'package:online_shopping_app/Core/widgets/custom_main_button.dart';
import 'package:online_shopping_app/Core/widgets/validation.dart';
import 'package:online_shopping_app/Features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:online_shopping_app/constants.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static const String routeName = "LogInView";
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: LogInView._formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const CustomAppBar(hasLoveIcon: false, text: 'Login'),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 8),
                  child: Text(
                    "Hi, Ahmed",
                    style: GoogleFonts.montserrat(
                        color: Constants.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  "Welcome back! Please enter ",
                  style: GoogleFonts.montserrat(
                      color: Constants.greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "your details.",
                  style: GoogleFonts.montserrat(
                      color: Constants.greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 72, left: 24, right: 24, bottom: 32),
                  child: CustomTextFormField(
                    onChanged: (value) {
                      // BlocProvider.of<UserCubit>(context).userModel.userEmail =
                      //     value;
                    },
                    suffixIcon: null,
                    validator: (value) {
                      return Validation.emailValidation(value);
                    },
                    obscureText: false,
                    isPassword: false,
                    lable: 'Email Address',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomTextFormField(
                    onChanged: (value) {
                      // BlocProvider.of<UserCubit>(context)
                      //     .userModel
                      //     .userPassword = value;
                    },
                    suffixIcon: const FaIcon(
                      FontAwesomeIcons.solidEyeSlash,
                      size: 20,
                      color: Constants.greyColor,
                    ),
                    validator: (value) {
                      return Validation.passwordValidation(value);
                    },
                    obscureText: true,
                    isPassword: true,
                    lable: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomMainButton(
                  text: "Login",
                  onTap: () async {
                    if (LogInView._formKey.currentState!.validate()) {
                      // await BlocProvider.of<UserCubit>(context)
                      //     .signInWithEmailAndPassword(context);
                      Navigator.of(context).pushAndRemoveUntil(
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return const CustomBottomNavigationBar();
                          },
                        ),
                        (_) => false,
                      );
                    } else {
                      setState(
                        () {
                          autovalidateMode = AutovalidateMode.always;
                        },
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
