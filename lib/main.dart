import 'package:barbershop/admin/admin_list_booking.dart';
import 'package:barbershop/admin/narbarmenu.dart';
import 'package:barbershop/login.dart';
import 'package:barbershop/user/generate_pesanan.dart';
import 'package:barbershop/user/user_services_booking.dart';
import 'package:barbershop/user/user_services.dart';
import 'package:barbershop/signup.dart';
import 'package:barbershop/splashscreen.dart';
import 'package:barbershop/start.dart';
import 'package:barbershop/user/user_shop_detail.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'user/navbarmenu.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String,WidgetBuilder>{
        "Login" : (BuildContext context) => Login(),
        "SignUp" : (BuildContext context) => SignUp(),
        "Start" : (BuildContext context) => Start(),
        "Menu" : (BuildContext context) => Navbarmenu(),
        "BookingServices" : (BuildContext context) => Booking(),
        "Services":(BuildContext context) => Services(),

        "ListBooking": (BuildContext context) =>AdminBooking(),
        "MenuAdmin":(BuildContext context)=>NavbarAdmin(),
        "Generate":(BuildContext context)=>GeneratePesanan(),
        "ShopDetail":(BuildContext context)=>ShopDetail()
      },
    );
  }
}

