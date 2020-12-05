import 'package:flutter/material.dart';
import 'package:quero_marmita/src/models/category.dart';

import '../commons.dart';
import 'custom_text.dart';

List<Category> categoriesList = [
  Category(name: "Marmitas", image: "marmita.png"),
  Category(name: "Bebidas", image: "bebidas.png"),
  Category(name: "Sobremesas", image: "sobremesas.png"),
  Category(name: "Lanches", image: "fastfood.png"),
  Category(name: "Sorvetes", image: "sorvetes.png"),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 95,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (_, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: brown,
                              offset: Offset(4, 6),
                              blurRadius: 20
                          ),
                        ],
                      ),
                      child: Padding(padding: EdgeInsets.all(4),
                        child: Image.asset("images/${categoriesList[index].image}", width: 60,),)
                  ),
                  SizedBox(height: 10,),
                  CustomText(text: categoriesList[index].name, size: 12, color: black,)
                ],
              ),
            );
          },
        )
    );
  }
}
