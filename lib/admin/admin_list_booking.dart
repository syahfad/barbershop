import 'package:barbershop/admin/list_booking_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminBooking extends StatefulWidget{
  @override
  _ShopState createState()=> _ShopState();
}

class _ShopState extends State<AdminBooking>{
  void initState(){
    super.initState();
    print('Calling iniState from services');
  }
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Booking',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: users.snapshots(),
            builder: (_,snapshot){
              if(snapshot.hasData){
                return Column(
                  children: snapshot.data.docs
                      .map((e) =>
                      ItemCard(
                          e.data()['name'],
                          e.data()['services'],
                          e.data()['date'],
                          e.data()['time'],
                        onDelete: (){
                            users.doc(e.id).delete();
                        },
                      ))
                      .toList(),
                );
              }else{
                return Text('Loading');
              }
            }
          )
        ],
      ),
    );
  }
}