import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
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
                  child: Image.asset(
                    'assets/vectors/onesta.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              height: 100,
              child: Card(
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
                            'Onesta Bar And Restaurent.',
                            style: GoogleFonts.varelaRound(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Moodbidri, bar and restaurent.',
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
                              color: Colors.green.shade400,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.star,size: 12,color: Colors.white,),
                                Text('4.8',style: GoogleFonts.varelaRound(color: Colors.white , fontSize: 12 , fontWeight: FontWeight.bold,),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
