import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';

class CuctomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? validator;
  bool obsecureText;
  bool isPasswordField;
  final IconData? prefixIcon;
  final IconData? suffixicon;
  final bool? filled;
  final Color? fillColor;

  CuctomTextField({
    super.key,
    required this.hintText,
    this.suffixicon,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.obsecureText = false,
    this.isPasswordField = false,
    this.filled,
    this.fillColor,
  });

  @override
  State<CuctomTextField> createState() => _CuctomTextFieldState();
}

class _CuctomTextFieldState extends State<CuctomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      style: TextStyle(fontFamily: 'Manrope', color: FrontEndCngig.kHabitColor),
      cursorColor: FrontEndCngig.kTextColor,
      controller: widget.controller,
      validator: (val) => widget.validator!(val!),
      obscureText: widget.obsecureText,
      decoration: InputDecoration(

        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        focusColor: FrontEndCngig.kHabitColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        filled: widget.filled,
        fillColor: widget.fillColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: FrontEndCngig.kTextColor.withOpacity(0.5),
            fontSize: 16,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400),
        prefixIcon: Icon(
          widget.prefixIcon,
        ),
        suffix: widget.isPasswordField
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.obsecureText = !widget.obsecureText;
                  });
                },
                child: widget.obsecureText
                    ? Text(
                        'Show',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      )
                    : Text(
                        'Hide',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ))
            : Icon(widget.suffixicon),
      ),
    );
  }
}
