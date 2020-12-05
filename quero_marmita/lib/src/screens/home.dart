import 'package:flutter/material.dart';
import 'package:quero_marmita/src/widgets/categories.dart';
import 'package:quero_marmita/src/widgets/custom_text.dart';

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

            Container(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (_, index){
                return Padding(padding: EdgeInsets.all(8),
                  child: Container(
                    height: 220,
                    width: 200,
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
                    child: Column(
                      children: <Widget>[
                        Image.asset("images/marmita3.png", height: 140,)
                      ],
                    ),
                  ),);
              },),
            )
          ],
        ),
      ),
    );
  }
}
