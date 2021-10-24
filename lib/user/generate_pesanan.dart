import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratePesanan extends StatefulWidget{
  int total;
  GeneratePesanan({this.total});
  @override
  _GenerateState createState()=> _GenerateState(total);
}

class _GenerateState extends State<GeneratePesanan>{
  int total;
  _GenerateState(this.total);
  String qrData = "Total ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate"),
        centerTitle:  true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            QrImage(data: qrData),
            SizedBox(height: 10.0,),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              child: Text("Generate QR CODE"),
              onPressed: () {
                if(total.toString().isEmpty){
                  setState(() {
                    qrData = "data tidak tersedia";
                  });
                }else{
                  setState(() {
                    qrData = qrData + total.toString();
                  });
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                    color: Colors.brown,
                    width: 1.0
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}