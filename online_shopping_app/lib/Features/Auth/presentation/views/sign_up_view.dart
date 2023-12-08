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

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const String routeName = "SignUpView";
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: SignUpView._formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const CustomAppBar(
                  hasLoveIcon: false,
                  text: "Sign Up",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 8),
                  child: Text(
                    "Let’s get started",
                    style: GoogleFonts.montserrat(
                        color: Constants.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  "The latest movies and series ",
                  style: GoogleFonts.montserrat(
                      color: Constants.greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "are here",
                  style: GoogleFonts.montserrat(
                      color: Constants.greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 64, left: 24, right: 24, bottom: 24),
                  child: CustomTextFormField(
                    suffixIcon: null,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return 'Field is requierd';
                      }
                    },
                    obscureText: false,
                    isPassword: false,
                    lable: 'Full name',
                    onChanged: (value) {
                      // BlocProvider.of<UserCubit>(context).userModel.userName =
                      //     value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: CustomTextFormField(
                    suffixIcon: null,
                    validator: (value) {
                      return Validation.emailValidation(value);
                    },
                    obscureText: false,
                    isPassword: false,
                    lable: 'Email Address',
                    onChanged: (value) {
                      // BlocProvider.of<UserCubit>(context).userModel.userEmail =
                      //     value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomTextFormField(
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
                    onChanged: (value) {
                      // BlocProvider.of<UserCubit>(context)
                      //     .userModel
                      //     .userPassword = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomMainButton(
                  text: "Sign Up",
                  onTap: () async {
                    if (SignUpView._formKey.currentState!.validate()) {
                      // await BlocProvider.of<UserCubit>(context)
                      //     .createUserWithEmailAndPassword(context);
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
