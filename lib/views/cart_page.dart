import 'package:cloud_kitchen/bloc/food/food_bloc.dart';
import 'package:cloud_kitchen/views/widgets/cart_card.dart';
import 'package:cloud_kitchen/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartPage extends StatefulWidget {
  final int userid;
  const CartPage({super.key, required this.userid});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isPageLoading = true;
  num sum = 0;
  TextEditingController adressController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<FoodBloc>(context).add(
      FoodFetchCartItems(userid: widget.userid),
    );
    super.initState();
  }

  void addAdress() async {
    final box = await Hive.openBox('details');
    box.put('adress', adressController.text);
    box.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodBloc, FoodState>(
      listener: (context, state) {
        if (state is FoodCartFetchSuccessState) {
          for (int i = 0; i < state.data.length; i++) {
            sum = sum + state.data[i].totalprice;
          }
          setState(() {
            _isPageLoading = false;
          });
        }
      },
      child: Skeletonizer(
        enabled: _isPageLoading,
        child: Scaffold(
          backgroundColor: Colors.amber.shade400,
          appBar: AppBar(
            backgroundColor: Colors.amber.shade400,
            automaticallyImplyLeading: false,
            leading: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            title: Text(
              "Cart",
              style: GoogleFonts.stylish(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
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
            child: BlocBuilder<FoodBloc, FoodState>(
              builder: (context, state) {
                if (state is FoodCartFetchSuccessState) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 20, top: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Add Adress",
                                style: GoogleFonts.varelaRound(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              CustomTextField(
                                icon: Icons.location_on,
                                placeholder: 'Adress',
                                controller: adressController,
                                isObscure: false,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                height: 60,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      Colors.amber.shade400,
                                    ),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    addAdress();
                                  },
                                  child: Center(
                                    child: Text(
                                      "Add Adress",
                                      style: GoogleFonts.stylish(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: CartCard(
                                name: state.data[index].foodname,
                                type: state.data[index].foodtype,
                                price: state.data[index].totalprice,
                                quantity: state.data[index].quantity,
                                image: state.data[index].image,
                                increment: () {
                                  setState(() {
                                    state.data[index].quantity++;
                                    state.data[index].totalprice =
                                        state.data[index].totalprice +
                                            state.data[index].foodprice;
                                  });
                                },
                                decrement: () {
                                  setState(() {
                                    state.data[index].quantity--;
                                    state.data[index].totalprice =
                                        state.data[index].totalprice -
                                            state.data[index].foodprice;
                                  });
                                },
                                remove: () => setState(() {
                                  state.data.removeAt(index);
                                }),
                              ),
                            );
                          },
                          itemCount: state.data.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Price:",
                                      style: GoogleFonts.varelaRound(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "₹$sum",
                                      style: GoogleFonts.varelaRound(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Discount:",
                                      style: GoogleFonts.varelaRound(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "₹${sum / 10 - 20}",
                                      style: GoogleFonts.varelaRound(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Amount After Discount:",
                                      style: GoogleFonts.varelaRound(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "₹${sum - (sum / 10 - 20)}",
                                      style: GoogleFonts.varelaRound(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.network_wifi_1_bar_rounded,
                          size: 40,
                        ),
                        Text(
                          'Something Went Wrong',
                          style: GoogleFonts.varelaRound(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          bottomSheet: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.amber.shade400),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  "Checkout",
                  style: GoogleFonts.stylish(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
