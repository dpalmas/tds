import 'package:doe_marmita/models/item_model.dart';

class Data {
  Future<List<Item>> getItems() async {
    await Future.delayed(Duration(milliseconds: 5000));
    final response = [
      {
        "title": "Marmita Tradicional",
        "range": 1.0,
        "value": 4.99,
        "star": 5,
        "imgUrl":
            "https://blog.saipos.com/wp-content/uploads/2017/03/Como-montar-seu-neg%C3%B3cio-de-delivery-de-marmitex-imagem4-SAIPOS-sistema-para-restaurantes.jpg"
      },
      {
        "title": "Marmita Bênto",
        "range": 3.0,
        "value": 9.99,
        "star": 5,
        "imgUrl": "https://skdesu.com/wp-content/uploads/2014/12/obento.jpg"
      },
      {
        "title": "Marmita Vegana",
        "range": 2.0,
        "value": 6.99,
        "star": 5,
        "imgUrl":
            "https://cdn.awsli.com.br/800x800/502/502688/produto/20491996/503d635ad1.jpg"
      },
      {
        "title": "Marmita Fit",
        "range": 4.0,
        "value": 7.99,
        "star": 5,
        "imgUrl":
            "https://uploads.metropoles.com/wp-content/uploads/2018/12/18165951/Frango-ao-molho-de-ervas-att.jpg"
      },
      {
        "title": "Marmita Frango",
        "range": 3.0,
        "value": 8.99,
        "star": 5,
        "imgUrl":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjhYrTpexi-K-bL2coTaB-AMqbfdeqLphhqA&usqp=CAU"
      }
    ];

    final items = response.map((e) => Item.fromJson(e)).toList();

    return items;
  }
}
