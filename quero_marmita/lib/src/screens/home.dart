import 'package:flutter/material.dart';
import 'package:quero_marmita/src/widgets/categories.dart';
import 'package:quero_marmita/src/widgets/custom_text.dart';
import 'package:quero_marmita/src/widgets/featured_products.dart';
import 'package:quero_marmita/src/widgets/small_floating_button.dart';

import '../commons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                      text: "O que você deseja comer?",
                      size: 18
                  )),
                Stack(
                  children: [
                    IconButton(icon: Icon(Icons.notifications_none), onPressed: (){},),
                    Positioned(
                      top: 10,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                        color: red,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: grey,
                      offset: Offset(1, 1),
                      blurRadius: 4
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.search, color: blue,),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: "Buscar produtos e restaurantes",
                      border: InputBorder.none
                    ),
                  ),
                  trailing: Icon(Icons.filter_list, color: blue,),
                ),

              ),
            ),
            SizedBox(
              height: 5,
            ),

            Categories(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: "Produtos em Destaque", size: 20, color: grey,),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: "Popular", size: 20, color: grey,),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("images/marmita6.png")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      SmallButton(Icons.favorite),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(Icons.star, color: Colors.yellow, size: 20)
                              ),
                              Text("4.5")
                            ],
                          ),
                          ),
                      ),
                ],
              ),
            )
          ],
        ),
      ),
      ],
        ),
      ),

      bottomNavigationBar: Container(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/home.png", width: 26, height: 26,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/target.png", width: 26, height: 26,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/shoppingcart.png", width: 26, height: 26,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/account.png", width: 26, height: 26,),
            ),
          ],
        ),
      ),
    );
  }
}
