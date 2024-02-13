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
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
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
                      color: Colors.grey,
                    ),
                    child: const Icon(
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
                    CustomOfferCard(
                      image:
                          'https://graphicsfamily.com/wp-content/uploads/edd/2021/07/Food-Offer-Banner-Design-Template.jpg',
                    ),
                    CustomOfferCard(
                      image:
                          'https://lapinozpizza.in/assets/wla_new/lapinoz/img/deals-banner-four.jpg',
                    ),
                    CustomOfferCard(
                      image:
                          'https://marketplace.canva.com/EAFyabjgBBI/1/0/1600w/canva-brown-and-orange-vintage-modern-americana-restaurant-and-food-banner-aGzWcJUrrHs.jpg',
                    ),
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
                        CustomCircleElement(
                          image: 'assets/vectors/burger.png',
                          foodName: 'Fast Food',
                        ),
                        CustomCircleElement(
                          image: 'assets/vectors/donut.png',
                          foodName: 'Cruller',
                        ),
                        CustomCircleElement(
                          image: 'assets/vectors/meals.png',
                          foodName: 'Meal',
                        ),
                        CustomCircleElement(
                          image: 'assets/vectors/pastery.png',
                          foodName: 'Cake',
                        ),
                        CustomCircleElement(
                          image: 'assets/vectors/desserts.png',
                          foodName: 'Dessert',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 27,
                        ),
                        CustomCircleElement(
                          image: 'assets/vectors/shakes.jpg',
                          foodName: 'Shakes',
                        ),
                        SizedBox(
                          width: 27,
                        ),
                        CustomCircleElement(
                          image: 'assets/vectors/soups.jpg',
                          foodName: 'Soup',
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
