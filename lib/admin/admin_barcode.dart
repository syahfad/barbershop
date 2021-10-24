import 'package:barbershop/admin/scan_pesanan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminBarcode extends StatefulWidget{
  @override
  _Barstate createState()=> _Barstate();
}

class _Barstate extends State<AdminBarcode>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan Pesanan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(image: NetworkImage("https://suryayogya.com/wp-content/uploads/2020/06/barcode.png")),
          flatButton("Scan Pesanan", ScanPesanan()),
          ],
        ),
      ),
    );
  }
  Widget flatButton(String text, Widget widget){
    return FlatButton(
      padding: EdgeInsets.all(10.0),
      child: Text(text),
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>widget));
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: Colors.brown,
          width: 1.0
        ),
      ),
    );
  }
}