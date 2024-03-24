import "package:cloud_kitchen/bloc/food/food_bloc.dart";
import "package:cloud_kitchen/bloc/home/home_bloc.dart";
import "package:cloud_kitchen/views/cart_page.dart";
import "package:cloud_kitchen/views/food_order_page.dart";
import "package:cloud_kitchen/views/widgets/cart_card.dart";
import "package:cloud_kitchen/views/widgets/custom_circle_elements.dart";
import "package:cloud_kitchen/views/widgets/custom_hotel_card.dart";
import "package:cloud_kitchen/views/widgets/custom_offer_card.dart";
import "package:cloud_kitchen/views/widgets/custom_text_field.dart";
import "package:flutter/cupertino.dart";
import 'package:intl/intl.dart';
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  String email = "";
  int userid = 0;
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(
      HomeInitalFetchEvent(),
    );
    getUserDetails();
    super.initState();
  }

  Future<void> getUserDetails() async {
    final box = await Hive.openBox('authkey');
    final details = JwtDecoder.decode(box.get('tokens'));
    setState(() {
      name = details['name'];
      email = details['email'];
      userid = details['userid'];
    });
  }

  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeInitialFetchState) {
          setState(() {
            loading = false;
          });
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: false,
          child: Scaffold(
            backgroundColor: Colors.amber.shade400,
            appBar: AppBar(
              backgroundColor: Colors.amber.shade400,
              elevation: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home',
                    style: GoogleFonts.stylish(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    email,
                    style: GoogleFonts.varelaRound(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              surfaceTintColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => FoodBloc(),
                          child: CartPage(
                            userid: userid,
                          ),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            body: Container(
              margin: const EdgeInsets.only(
                top: 1,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
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
                            placeholder: 'Search for Hotels...',
                            icon: Icons.search,
                            isObscure: false,
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
                      child: PageView.builder(
                        itemBuilder: (context, index) {
                          return CustomOfferCard(
                            image:
                                "https://graphicsfamily.com/wp-content/uploads/edd/2021/07/Food-Offer-Banner-Design-Template.jpg",
                            onOfferPressed: () {
                              //pending
                            },
                          );
                        },
                        itemCount: 5,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomCircleElement(
                                image: 'assets/vectors/burger.png',
                                foodName: 'Fast Food',
                                onPressed: () {
                                  
                                },
                              ),
                              CustomCircleElement(
                                image: 'assets/vectors/donut.png',
                                foodName: 'Cruller',
                                onPressed: () {
                                },
                              ),
                              CustomCircleElement(
                                image: 'assets/vectors/meals.png',
                                foodName: 'Meal',
                                onPressed: () {
                                  //pending
                                },
                              ),
                              CustomCircleElement(
                                image: 'assets/vectors/pastery.png',
                                foodName: 'Cake',
                                onPressed: () {
                                  //pending
                                },
                              ),
                              CustomCircleElement(
                                image: 'assets/vectors/desserts.png',
                                foodName: 'Dessert',
                                onPressed: () {
                                  //pending
                                },
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 27,
                              ),
                              CustomCircleElement(
                                image: 'assets/vectors/shakes.jpg',
                                foodName: 'Shakes',
                                onPressed: () {
                                  //pending
                                },
                              ),
                              const SizedBox(
                                width: 27,
                              ),
                              CustomCircleElement(
                                image: 'assets/vectors/soups.jpg',
                                foodName: 'Soup',
                                onPressed: () {
                                  //pending
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocListener<HomeBloc, HomeState>(
                      listener: (context, state) {},
                      child: ListView.builder(
                        itemBuilder: (condatatext, index) {
                          return BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                              if (state is HomeInitialFetchState) {
                                return Column(
                                  children: [
                                    HotelCard(
                                      image: state.data[index].image,
                                      hotelName: state.data[index].name,
                                      hotelLocation: state.data[index].adress,
                                      rating: state.data[index].rating,
                                      onOrderButtonClicked: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BlocProvider(
                                              create: (context) => FoodBloc(),
                                              child: FoodOrderPage(
                                                  userid: userid,
                                                  hotelName:
                                                      state.data[index].name,
                                                  constraints: "hotel",
                                                  parameter:
                                                      state.data[index].id),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 60,
                                    )
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            },
                          );
                        },
                        itemCount: (state is HomeInitialFetchState)
                            ? state.data.length
                            : 0,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
