import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final IconData icon;
  final IconData ? suffixIcon;
  const CustomTextField({super.key , required this.placeholder , required this.icon , this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: 60,
      child: CupertinoTextField(
        obscureText: true,
        placeholder: placeholder,
        style: GoogleFonts.varelaRound(fontSize: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        showCursor: true,
        cursorColor: Colors.brown,
        prefix: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Icon(
            icon,
            color: Colors.brown,
          ),
        ),
      ),
    );
  }
}