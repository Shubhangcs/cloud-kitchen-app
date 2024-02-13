import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelCard extends StatelessWidget {
  final String image;
  final String hotelName;
  final String hotelLocation;
  final double rating;
  final VoidCallback onOrderButtonClicked;
  const HotelCard({
    super.key,
    required this.image,
    required this.hotelName,
    required this.hotelLocation,
    required this.rating,
    required this.onOrderButtonClicked
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 1.8),
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 10,
          height: 200,
          child: Card(
            surfaceTintColor: Colors.transparent,
            elevation: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          height: 100,
          child: Card(
            elevation: 5,
            surfaceTintColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotelName,
                        style: GoogleFonts.varelaRound(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        hotelLocation,
                        style: GoogleFonts.varelaRound(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          color: rating >= 4
                              ? Colors.green
                              : rating >= 3
                                  ? Colors.amber
                                  : rating >= 2
                                      ? Colors.orange
                                      : Colors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onOrderButtonClicked,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade600,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Order',
                        style: GoogleFonts.varelaRound(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
