import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 10,
          child: Center(
            child: Stack(
              alignment: const Alignment(0, 2.2),
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 10),
                      borderRadius: BorderRadius.circular(10)),
                  child: Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      child: Image.asset('assets/vectors/onesta.jpg'),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width-20,
                  height: 100,
                  child: Card(
                    elevation: 5,
                    surfaceTintColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
