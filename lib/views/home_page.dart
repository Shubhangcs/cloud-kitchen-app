import "package:cloud_kitchen/views/widgets/custom_text_field.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";


class myhome extends StatefulWidget {
  const myhome({super.key});

  @override
  State<myhome> createState() => _myhomeState();
}

class _myhomeState extends State<myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [CircleAvatar(child: Image.asset('assets/logo.png'),)],

      ),

      body:Column(
        children: [
          SizedBox(height: 30,),
          Row(children: [Container(width: MediaQuery.of(context).size.width,decoration:BoxDecoration(boxShadow: [BoxShadow(offset:Offset(4, 4),blurRadius:10 , spreadRadius: 1,color:Colors.grey.shade200),BoxShadow(offset:Offset(-4, -4),blurRadius: 10 , spreadRadius: 1 , color: Colors.grey.shade300 )]),child: CustomTextField(placeholder: 'search food/juice', icon:Icons.search))],),
          SizedBox(height: 20,),
          Container(margin: EdgeInsets.only(left: 10,right: 10),width: MediaQuery.of(context).size.width,height:140,child: Card(

          ),),
          SizedBox(height: 20,),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: 
                [
                Column(
                  children: [
                    CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1311008414156423170/Kxu_7mQS_400x400.jpg')),
                    SizedBox(height: 7,),
                    Text('CAT'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1311008414156423170/Kxu_7mQS_400x400.jpg')),
                    SizedBox(height: 7,),
                    Text('CAT'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1311008414156423170/Kxu_7mQS_400x400.jpg')),
                    SizedBox(height: 7,),
                    Text('CAT'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1311008414156423170/Kxu_7mQS_400x400.jpg')),
                    SizedBox(height: 7,),
                    Text('CAT'),
                  ],
                )],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: 
                [
                Column(
                  children: [
                    CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1311008414156423170/Kxu_7mQS_400x400.jpg')),
                    SizedBox(height: 7,),
                    Text('CAT'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1311008414156423170/Kxu_7mQS_400x400.jpg')),
                    SizedBox(height: 7,),
                    Text('CAT'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1311008414156423170/Kxu_7mQS_400x400.jpg')),
                    SizedBox(height: 7,),
                    Text('CAT'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1311008414156423170/Kxu_7mQS_400x400.jpg')),
                    SizedBox(height: 7,),
                    Text('CAT'),
                  ],
                )],
                ),
                SizedBox(height: 30,),
                Container(
                  child: Text('HOTELS'),
                )
              ],
            ),
          )


        ],
      ),
    );
  }
}