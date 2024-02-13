import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCircleElement extends StatelessWidget {
  final String image;
  final String foodName;
  final VoidCallback onPressed;
  const CustomCircleElement(
      {super.key, required this.image, required this.foodName , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                image,
              ),
              radius: 25,
            ),
            Text(
              foodName,
              style: GoogleFonts.varelaRound(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
