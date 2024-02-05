import "package:cloud_kitchen/views/widgets/custom_circle_elements.dart";
import "package:cloud_kitchen/views/widgets/custom_offer_card.dart";
import "package:cloud_kitchen/views/widgets/custom_text_field.dart";
import 'package:cloud_kitchen/views/widgets/food_card.dart';
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade400,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        elevation: 0,
        title: Text(
          'Home',
          style: GoogleFonts.stylish(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20),),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 50,
                    child: const CustomTextField(
                      placeholder: 'Search...',
                      icon: Icons.search,
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.brown),
                    child: Icon(
                      Icons.filter_alt_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 220,
                child: PageView(
                  children: const [
                    CustomOfferCard(),
                    CustomOfferCard(),
                    CustomOfferCard(),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCircleElement(),
                        CustomCircleElement(),
                        CustomCircleElement(),
                        CustomCircleElement(),
                        CustomCircleElement()
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCircleElement(),
                        CustomCircleElement(),
                        CustomCircleElement(),
                        CustomCircleElement(),
                        CustomCircleElement()
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              const FoodCard(),
            ],
          ),
        ),
      ),
    );
  }
}
