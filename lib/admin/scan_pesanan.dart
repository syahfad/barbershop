import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class ScanPesanan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<ScanPesanan> {
  String qrResult = "Not yed Scanned";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Text(
          "Result",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          qrResult,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.0
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        FlatButton(
          padding: EdgeInsets.all(15.0),
          child: Text("Scan Pesanan"),
          onPressed: () async{
            String scaning  = await BarcodeScanner.scan();
            setState(() {
              qrResult = scaning;
            });
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
    ),);
  }
}