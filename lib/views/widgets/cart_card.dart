import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard extends StatelessWidget {
  final String name;
  final String type;
  final int price;
  final int quantity;
  final String image;
  const CartCard(
      {super.key,
      required this.name,
      required this.type,
      required this.price,
      required this.quantity,
      required this.image
      });

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Card(
            child: Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      image: DecorationImage(image: NetworkImage(image) , fit: BoxFit.cover),),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 185,
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.varelaRound(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        'Type: $type',
                        style: GoogleFonts.varelaRound(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '₹$price',
                        style: GoogleFonts.varelaRound(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      Row(
                        children: [
                          Text(
                            '+',
                            style: GoogleFonts.varelaRound(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '$quantity',
                            style: GoogleFonts.varelaRound(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '-',
                            style: GoogleFonts.varelaRound(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.shade400,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
