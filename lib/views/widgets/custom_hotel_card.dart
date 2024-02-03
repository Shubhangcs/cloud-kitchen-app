import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      margin:EdgeInsets.only(left: 20, right: 20 , top: 10 , bottom: 10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber,width: 5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/vectors/onesta.jpg',fit:BoxFit.fill,),
                  // child: ClipRRect(
                  //   child: Image.network(
                  //    'https://scontent.fixe3-1.fna.fbcdn.net/v/t1.6435-9/49060565_1744703918968063_6902331032461115392_n.jpg?stp=dst-jpg_s1080x2048&_nc_cat=108&ccb=1-7&_nc_sid=b6975d&_nc_ohc=c79Ar4cP92oAX_C8079&_nc_ht=scontent.fixe3-1.fna&oh=00_AfCr7vhgH9dzlRQG8nOUjgr5flGJjN9iI6jFhTosag0XFw&oe=65E3CBEC'
                  //   ),
                  //   borderRadius: BorderRadius.circular(40),
                  // ),
                ),
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          width: 200,
                          child: Text(
                            'Onesta',maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15 , top: 4),
                          width: 200,
                          child: Text(
                            'Pizza & Bevarages',
                            style: GoogleFonts.varelaRound(
                                color: Colors.blueGrey, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Container( 
                      margin: EdgeInsets.only(right: 10),
                      height: 50,
                      width: 50,
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.brown,
                            weight: 60,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
