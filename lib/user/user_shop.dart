import 'package:barbershop/user/shop_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Shop extends StatefulWidget{
  @override
  _ShopState createState()=> _ShopState();
}

class _ShopState extends State<Shop>{
  void initState(){
    super.initState();
    print('Calling iniState from services');
  }
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('shop');
    return Scaffold(
      floatingActionButton: buildBuyButton(),
      appBar: AppBar(
        title: Text(
          'Shop',
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
                        ShopCard(
                          e.data()['name'],
                          e.data()['price'],
                          e.data()['imgPath'],
                          e.data()['desc'],
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
  Widget buildBuyButton()=> FloatingActionButton.extended(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    foregroundColor: Colors.white,
    backgroundColor: Colors.brown,
    icon: Icon(Icons.add_shopping_cart),
    label: Text("Beli Sekarang"),
    onPressed: (){
      Navigator.pushReplacementNamed(context, "ShopDetail");
    },
  );
}

