import 'package:cloud_kitchen/bloc/food/food_bloc.dart';
import 'package:cloud_kitchen/views/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../bloc/home/home_bloc.dart';

class FoodOrderPage extends StatefulWidget {
  final int userid;
  final String constraints;
  final dynamic parameter;
  final String hotelName;
  const FoodOrderPage(
      {super.key,
      required this.hotelName,
      required this.constraints,
      required this.parameter,
      required this.userid});

  @override
  State<FoodOrderPage> createState() => _FoodOrderPageState();
}

class _FoodOrderPageState extends State<FoodOrderPage> {
  bool _isLoading = true;
  @override
  void initState() {
    BlocProvider.of<FoodBloc>(context).add(
      FoodFetchEvent(
        data: widget.parameter,
        constraint: widget.constraints,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodBloc, FoodState>(
      listener: (context, state) {
        if (state is FoodFetchSuccessState) {
          setState(() {
            _isLoading = false;
          });
        } else if (state is LoadingState) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow,
                  ),
                );
              });
        } else if (state is FoodAddedSuccessState) {
          Navigator.pop(context);
          Navigator.pop(context);
        }
      },
      child: Skeletonizer(
        enabled: _isLoading,
        child: Scaffold(
          backgroundColor: Colors.amber.shade400,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.amber.shade400,
            title: Text(
              "Foods",
              style: GoogleFonts.stylish(
                color: Colors.white,
                fontSize: 25,
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
                if (state is FoodFetchSuccessState) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          FoodCard(
                            foodName: state.data[index].name,
                            image: state.data[index].foodImage,
                            type: state.data[index].type,
                            hotelName: widget.hotelName,
                            rating: double.parse(state.data[index].rating),
                            price: "₹${state.data[index].price}",
                            isItemAdded: state.data[index].isAddedFood,
                            count: state.data[index].count,
                            onPressed: () {
                              setState(() {
                                state.data[index].isAddedFood = true;
                              });
                            },
                            increment: () {
                              setState(() {
                                state.data[index].count++;
                              });
                            },
                            decrement: () {
                              setState(() {
                                if (state.data[index].count > 1) {
                                  state.data[index].count--;
                                }
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                    itemCount: state.data.length,
                  );
                } else {
                  return const Center(
                    child: Column(
                      children: [
                        Icon(Icons.wifi_off_rounded, color: Colors.grey),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Something Went Wrong Try Again",
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          bottomSheet: BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              return Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (state is FoodFetchSuccessState) {
                      BlocProvider.of<FoodBloc>(context).add(
                        FoodAddEvent(data: state.data, userid: widget.userid),
                      );
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.amber.shade400,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Add To Cart",
                      style: GoogleFonts.stylish(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
