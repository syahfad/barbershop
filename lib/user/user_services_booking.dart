import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget{
  var title;
  Booking({Key mykey, this.title}) : super(key:mykey);
  @override
  _BookingState createState()=> _BookingState();
}

class _BookingState extends State<Booking>{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  DateTime pickedDate;
  TimeOfDay time;
  String dateday;
  String waktu;

  @override
  void initState(){
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Service",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
              Text("${widget.title}",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "your name",
                  labelText: "Name",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  )
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: ageController,
                decoration: InputDecoration(
                  hintText: "your age",
                  labelText: "Age",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  )
                ),
              ),
              ListTile(
                focusColor: Colors.amberAccent,
                title: Text("Date: ${pickedDate.year},${pickedDate.month},${pickedDate.day}"),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: _pickDate,
              ),
              ListTile(
                title: Text("Time: ${time.hour}:${time.minute}"),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: _pickTime,
              ),
              SizedBox(height: 10),
              Center(
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  color: Colors.brown,
                  child: Text('Book Now!',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  textColor: Colors.white,
                  onPressed: (){
                    users.add({
                      'services':widget.title,
                      'name':nameController.text,
                      'age':int.tryParse(ageController.text) ?? 0,
                      'time':time.toString(),
                      'date':pickedDate.toString()
                    });
                    bookServices(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void bookServices(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text("Services Booked Successfully"),
      content: Text("Don't forget to come on time"),
      actions: [
        RaisedButton(
          color: Colors.brown,
          child: Text('Confirm'),
          onPressed: (){
            Navigator.pushReplacementNamed(context, "Menu");
          },
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
    );
  }
  _pickDate() async{
    DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year-5),
        lastDate: DateTime(DateTime.now().year+5),
        initialDate: pickedDate,
    );
    if(date != null){
      setState(() {
        pickedDate = date;
      });
    }
  }
  _pickTime() async{
    TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: time
    );
    if(t != null){
      setState(() {
        time = t;
      });
    }
  }
}