import 'package:barbershop/user/user_services_booking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServicesDetail extends StatefulWidget {
  final DocumentSnapshot post;
  ServicesDetail({this.post});
  @override
  _ServicesDetailState createState() => _ServicesDetailState();
}
class _ServicesDetailState extends State<ServicesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }
  Widget getBody(){
    var size = MediaQuery.of(context).size;
    var title = widget.post.data()['title'];
    return SingleChildScrollView(child: Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.post.data()['images']),
                fit: BoxFit.cover
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                      Icons.arrow_back_outlined,
                      color:Colors.white,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                          Icons.favorite_border,
                          color:Colors.white,
                      ),
                      SizedBox(width: 20,),
                      Icon(
                          Icons.share_outlined,
                          color:Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height*0.42),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50)
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  child: Container(
                    width: 150,
                    height: 7,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                    widget.post.data()['title'],
                    style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Rp. '+widget.post.data()['price'].toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Description :',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey),
                ),
                Text(
                  widget.post.data()['desc'],
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Durasi :',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey),
                ),
                Text(
                  widget.post.data()['duration'].toString() ,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                  ),
                ),
          SizedBox(height: 20,),
          Center(
            child:RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 40),
              child: Text(
                'Booking',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
              color: Colors.brown,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Booking
                  (title: title)));
              },
            ),
          )

              ],
            ),
          ),
        ),
      ],
    ));
  }
}
