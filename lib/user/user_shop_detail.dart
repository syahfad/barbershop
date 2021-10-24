
import 'package:barbershop/user/generate_pesanan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopDetail extends StatefulWidget{
  @override
  _ShopDetailState createState()=> _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail>{
  int total = 0;
  int priceProducet = 0;
  int pricePomade = 50000;
  int priceHairShampoo = 40000;
  int priceHairPowder = 90000;
  @override
  Widget build(BuildContext context) {
    CollectionReference shop = FirebaseFirestore.instance.collection('shop');
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('Shop Detail',
            style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.brown,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Pomade"+" - "+pricePomade.toString(),
                style: TextStyle(
                  fontSize: 14
                ),
              ),
              Container(
                height: 30,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  onChanged: (value){},
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Hair Shampoo"+" - "+priceHairShampoo.toString(),
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              Container(
                height: 30,
                child: TextField(
                  controller: controller2,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Hair Powder"+" - "+priceHairPowder.toString(),
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              Container(
                height: 30,
                child: TextField(
                  controller: controller3,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: FlatButton(
                  child: Text("Submit"),
                  color: Colors.brown,
                  textColor: Colors.white,
                  onPressed: (){
                    setState(() {
                      total = (pricePomade * int.parse(controller.text)) +
                              (priceHairShampoo * int.parse(controller2.text)) +
                              (priceHairPowder * int.parse(controller3.text));
                    });
                  },
                ),
              ),
              Center(
                child: Text("Total = "+total.toString()),
              ),
              SizedBox(height: 20,),
              Center(
                child: RaisedButton(
                  child: Text("Pesan Sekarang!"),
                  color: Colors.brown,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GeneratePesanan(total : total)
                    ));
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}