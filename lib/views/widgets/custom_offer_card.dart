import 'package:flutter/material.dart';


class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: EdgeInsets.only(left: 10 , right: 10 , top: 10 , bottom: 30),
        surfaceTintColor: Colors.transparent,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10,),),
        child: Center(child: Image.asset('assets/logo.png',fit: BoxFit.cover,),),
    );
  }
}