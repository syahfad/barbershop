
import 'package:barbershop/user/user_shop_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final String name;
  final int price;
  final String imgPath;
  final String desc;

  ShopCard(this.name, this.price, this.imgPath, this.desc);

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Card(
            elevation: 12,
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Ink.image(
                      image: NetworkImage(imgPath),
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        bottom: 16,
                        right: 16,
                        left: 16,
                        child: Text(
                          name + "\n" + "Rp. " + price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    desc,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                // Container(
                //     padding: EdgeInsets.all(16),
                //     child: CartCounter()
                // ),
              ],
            ),
          ),
        ),
      );
  }
}

