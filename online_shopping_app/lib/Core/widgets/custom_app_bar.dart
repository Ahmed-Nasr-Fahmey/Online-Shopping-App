import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/constants.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    this.text,
    required this.hasLoveIcon,
  });
  final String? text;
  final bool hasLoveIcon;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.text == null ? '' : widget.text!,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          color: Constants.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.12,
        ),
      ),
      leading: Center(
        child: Container(
          width: 32,
          height: 32,
          decoration: ShapeDecoration(
            color: Constants.greyColor.withOpacity(0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const FaIcon(
              FontAwesomeIcons.angleLeft,
              size: 20,
              color: Constants.whiteColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
