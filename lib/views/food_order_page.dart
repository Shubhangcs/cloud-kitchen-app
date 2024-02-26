import 'package:cloud_kitchen/views/widgets/food_card.dart';
import 'package:flutter/material.dart';

class FoodOrderPage extends StatefulWidget {
  const FoodOrderPage({super.key});

  @override
  State<FoodOrderPage> createState() => _FoodOrderPageState();
}

class _FoodOrderPageState extends State<FoodOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade600,
        title: Text(
          "Foods",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              10,
            ),
            topRight: Radius.circular(
              10,
            ),
          ),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return FoodCard(
                foodName: "Masala Dosa",
                image:
                    "https://eastindianrecipes.net/wp-content/uploads/2022/09/How-to-Make-North-Indian-Thali-Vegetarian-7-500x500.jpg",
                type: "veg",
                hotelName: "hotel sagar",
                rating: 4.2);
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
