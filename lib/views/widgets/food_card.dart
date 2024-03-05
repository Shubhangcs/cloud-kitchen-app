import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatelessWidget {
  final String foodName;
  final String image;
  final String type;
  final String hotelName;
  final double rating;
  final String price;
  final VoidCallback onPressed;
  final VoidCallback decrement;
  final VoidCallback increment;
  bool isItemAdded = false;
  final int count;
  FoodCard(
      {super.key,
      required this.foodName,
      required this.image,
      required this.type,
      required this.hotelName,
      required this.rating,
      required this.price,
      required this.onPressed,
      required this.isItemAdded,
      required this.count,
      required this.decrement,
      required this.increment
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 10,
      height: 120,
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 10,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5, right: 10),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    image,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 193,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    foodName,
                    style: GoogleFonts.varelaRound(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Type: $type',
                    style: GoogleFonts.varelaRound(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    hotelName,
                    style: GoogleFonts.varelaRound(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    price,
                    style: GoogleFonts.varelaRound(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Container(
                    width: 45,
                    height: 20,
                    decoration: BoxDecoration(
                      color: rating >= 4
                          ? Colors.green
                          : rating >= 3
                              ? Colors.amber
                              : rating >= 2
                                  ? Colors.orange
                                  : Colors.red,
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.white,
                        ),
                        Text(
                          '$rating',
                          style: GoogleFonts.varelaRound(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            (isItemAdded)
                ? Row(
                    children: [
                      GestureDetector(
                        onTap: increment,
                        child: Container(
                          height: 30,
                          width: 14,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(
                                  10,
                                ),
                              ),
                              color: Colors.amber),
                          child: const Center(
                            child: Text(
                              '+',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Center(
                          child: Text(
                            '$count',
                            style: GoogleFonts.varelaRound(color: Colors.white , fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: decrement,
                        child: Container(
                          height: 30,
                          width: 14,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                  10,
                                ),
                                bottomRight: Radius.circular(
                                  10,
                                ),
                              ),
                              color: Colors.amber),
                          child: Center(
                            child: Text(
                              '-',
                              style:
                                  GoogleFonts.varelaRound(color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: onPressed,
                    child: Container(
                      margin:
                          const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                      height: 30,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                      ),
                      child: Center(
                        child: Text(
                          'Add',
                          style: GoogleFonts.varelaRound(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
