import 'package:cloud_kitchen/views/home_page.dart';
import 'package:cloud_kitchen/views/landing.dart';
import 'package:cloud_kitchen/views/widgets/custom_hotel_card.dart';
import 'package:cloud_kitchen/views/widgets/menu_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: menu_card(),
    );
  }
}
