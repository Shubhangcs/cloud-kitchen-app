import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatelessWidget {
  final String foodName;
  final String image;
  final String type;
  final String hotelName;
  final double rating;
  const FoodCard({
    super.key,
    required this.foodName,
    required this.image,
    required this.type,
    required this.hotelName,
    required this.rating,
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
              width: MediaQuery.of(context).size.width - 196,
              decoration: BoxDecoration(
                color: Colors.white,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Type: $type',
                    style: GoogleFonts.varelaRound(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    hotelName,
                    style: GoogleFonts.varelaRound(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
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
            Container(
              margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
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
          ],
        ),
      ),
    );
  }
}
