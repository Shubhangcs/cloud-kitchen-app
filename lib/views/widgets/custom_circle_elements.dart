import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomCircleElement extends StatelessWidget {
  const CustomCircleElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/vectors/burger.png'),
            radius: 25,
          ),
          Text('Food',style: GoogleFonts.varelaRound(color: Colors.black),),
        ],
      ),
    );
  }
}