import 'package:flutter/material.dart';

class CustomOfferCard extends StatelessWidget {
  final String image;
  const CustomOfferCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 30,
      ),
      surfaceTintColor: Colors.transparent,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
