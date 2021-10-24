import 'package:barbershop/user/user_services_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Services extends StatefulWidget{
  @override
  _ServicesState createState()=> _ServicesState();
}

class _ServicesState extends State<Services>{
  void initState(){
    super.initState();
    print('Calling iniState from services');
  }
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('services');
    return Scaffold(
      appBar: AppBar(

        title: Text(
          'Services',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasError){
            return Text('something went wrong');
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text('Loading');
          }
          return new ListView(
            padding: EdgeInsets.all(10),
            children: snapshot.data.docs.map((DocumentSnapshot document){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesDetail(post: document,)));
                },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),

                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 70,
                          child: Image.network(document.data()['images']),
                          alignment: Alignment.centerLeft,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                document.data()['title'],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: 200,
                                  child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      strutStyle: StrutStyle(fontSize: 12.0),
                                      text: TextSpan(
                                          style: TextStyle(color: Colors.grey),
                                          text: document.data()['desc']
                                      )
                                  ),
                                ),
                              SizedBox(height: 5),
                              Text('Rp. '+
                                  document.data()['price'].toString()+' Rupiah',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}