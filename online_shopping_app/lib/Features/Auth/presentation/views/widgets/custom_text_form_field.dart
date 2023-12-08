import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/constants.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.suffixIcon,
    required this.validator,
    required this.obscureText,
    required this.isPassword,
    this.onChanged,
    required this.lable,
  });
  final String lable;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  final Function(String)? onChanged;
  bool obscureText;
  final bool isPassword;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      style: GoogleFonts.montserrat(
        color: Constants.greyColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.12,
      ),
      cursorColor: Constants.greyColor,
      decoration: InputDecoration(
        label: Text(
          widget.lable,
          style: GoogleFonts.montserrat(
            color: Constants.whiteColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.12,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Constants.greyColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Constants.greyColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Constants.greyColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 24,
            top: 12,
          ),
          child: !widget.isPassword
              ? widget.suffixIcon
              : GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        widget.obscureText = !widget.obscureText;
                        if (widget.obscureText) {
                          widget.suffixIcon = const FaIcon(
                            FontAwesomeIcons.solidEyeSlash,
                            size: 20,
                            color: Constants.greyColor,
                          );
                        } else {
                          widget.suffixIcon = const FaIcon(
                            FontAwesomeIcons.solidEye,
                            size: 20,
                            color: Constants.greyColor,
                          );
                        }
                      },
                    );
                  },
                  child: widget.suffixIcon,
                ),
        ),
      ),
      validator: widget.validator,
    );
  }
}
