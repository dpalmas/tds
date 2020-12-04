import 'package:flutter/material.dart';
import 'package:quero_marmita/src/widgets/title.dart';

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
            Container(
              height: 120,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: orange,
                            offset: Offset(4, 6),
                            blurRadius: 20
                        ),
                      ],
                    ),
                    child: Padding(padding: EdgeInsets.all(4),
                    child: Image.asset("images/marmita.png", width: 100,),)
                  ),
                  SizedBox(height: 5,),
                  CustomText(text: "Marmitas",)
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
