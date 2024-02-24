import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final IconData icon;
  final IconData? suffixIcon;
  final bool isObscure;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key,
      required this.placeholder,
      required this.icon,
      this.suffixIcon,
      this.controller,
      required this.isObscure});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: 60,
      child: CupertinoTextField(
        obscureText: isObscure,
        placeholder: placeholder,
        controller: controller,
        style: GoogleFonts.varelaRound(fontSize: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100,
        ),
        showCursor: true,
        cursorColor: Colors.grey,
        prefix: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
