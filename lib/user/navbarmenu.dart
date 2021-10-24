import 'package:barbershop/user/user_profile.dart';
import 'package:barbershop/user/user_services.dart';
import 'package:barbershop/user/user_shop.dart';
import 'package:flutter/material.dart';

class Navbarmenu extends StatefulWidget{
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Navbarmenu>{
  int _selectedItemIndex = 0;
  List<Widget> _widgetOptions = [Services(),Shop(),Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedItemIndex),
          )
        ],
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavbarItem(Icons.content_cut,0),
          buildNavbarItem(Icons.shopping_cart,1),
          buildNavbarItem(Icons.account_circle,2)
        ],
      ),
    );
  }
  Widget buildNavbarItem(IconData icon,int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width/3,
        decoration: index == _selectedItemIndex
            ?BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 4,color: Colors.brown)
              ),
              gradient: LinearGradient(colors: [
              Colors.brown.withOpacity(0.3),
              Colors.brown.withOpacity(0.015)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter
          ),
            // color: index == _selectedItemIndex? Colors.brown:Colors.white
        ):BoxDecoration(),
        child: Icon(icon,color: index == _selectedItemIndex?Colors.black:Colors.grey),
      ),
    );
  }
}
