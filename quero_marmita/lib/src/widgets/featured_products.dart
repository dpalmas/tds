import 'package:flutter/material.dart';
import 'package:quero_marmita/src/models/products.dart';

import '../commons.dart';
import 'custom_text.dart';

List<Product> productsList = [
  Product(name: "Marmita Bentô", price: 19.99, rating: 4.5, vendor: "Asitex", wishList: true, image: "marmita9.png"),
  Product(name: "Marmita Tradicional", price: 10.99, rating: 4.2, vendor: "Marmitex", wishList: true, image: "marmita3.png"),
  Product(name: "Marmita Fit", price: 24.99, rating: 4.7, vendor: "Eurotex", wishList: true, image: "marmita7.png"),
  Product(name: "Suco de Laranja", price: 4.99, rating: 4.8, vendor: "Marmitex", wishList: true, image: "sucolaranja.png"),
  Product(name: "Açaí", price: 7.99, rating: 4.9, vendor: "Marmitex", wishList: true, image: "acai.png"),
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsList.length,
        itemBuilder: (_, index){
          return Padding(
            padding: EdgeInsets.fromLTRB(12, 14, 16, 12),
            child: Container(
              height: 240,
              width: 200,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                      color: grey,
                      offset: Offset(15, 5),
                      blurRadius: 30
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Image.asset("images/${productsList[index].image}", height: 140, width: 140,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(text: productsList[index].name),
                      ),
                      Padding(padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                  color: grey,
                                  offset: Offset(1, 1),
                                  blurRadius: 4
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: productsList[index].wishList ?
                            Icon(Icons.favorite, color: red, size: 18,) :
                            Icon(Icons.favorite_border, color: red, size: 18,),
                          ),
                        ),)
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CustomText(text: productsList[index].rating.toString(), color: grey, size: 14,),
                          ),
                          SizedBox(width: 2,),
                          Icon(Icons.star, color: blue, size: 16,),
                          Icon(Icons.star, color: blue, size: 16,),
                          Icon(Icons.star, color: blue, size: 16,),
                          Icon(Icons.star, color: blue, size: 16,),
                          Icon(Icons.star, color: grey, size: 16,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CustomText(text: "R\u{0024}${productsList[index].price}", weight: FontWeight.bold,),
                      )
                    ],
                  )
                ],
              ),
            ),);
        },),
    );
  }
}

