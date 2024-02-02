import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class menu_card extends StatelessWidget {
  const menu_card({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
        // color: Colors.amber,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
                
              ),
              color: Colors.amber,
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      margin: EdgeInsets.only(left: 5,top: 10,bottom: 10),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        radius: 40,
                        
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 180,
                          child: Text(
                            'Food Name',maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10,top: 4),
                          width: 180,
                          child: Text(
                            'Veg or Non-veg',
                            style: GoogleFonts.varelaRound(
                                color: Colors.blueGrey, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10,top: 10),
                          width: 60,
                          child: Center(
                            child: Text(
                              'Price',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.blueGrey, fontSize: 15),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10,top: 10),
                          height: 40,
                          width: 70,
                          // color: Colors.green,
                          child: ElevatedButton(onPressed: (){}, 
                          child:Icon(Icons.add_shopping_cart_rounded,color: Colors.green,)
                          ),
                          // child:Card(
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(5)
                          //   ),
                          //   color: Colors.green,
                          //   child: Text('Add',
                          //   style: GoogleFonts.varelaRound(
                          //         color: Colors.white, fontSize: 15),
                          //   ),
                          // ) ,
                          
                          
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}