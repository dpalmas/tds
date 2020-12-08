import 'package:doe_marmita/data/data.dart';
import 'package:doe_marmita/pages/login.dart';
import 'package:doe_marmita/pages/restaurant.dart';
import 'package:doe_marmita/pages/starDisplay.dart';

import 'package:flutter/material.dart';

import 'models/item_model.dart';

void main() => runApp(MyApp());
List<String> buttonsTitle = [
  "Todos",
  "Popular",
  "Sobremesa",
  "Bebidas",
  "Lanches"
];

List<String> restaurantList = [
  "Marmita Bênto",
  "Marmita Tradicional",
  "Marmita Fit",
  "Marmita Européia"
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Doe-Marmita',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Montserrat',
      ),
      home: LoginPage(),
    );
  }
}

class Home extends StatelessWidget {
  final controller = Data();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("08/12/2020"),
                          Text(
                            "Seja solidário! Doe uma Marmita!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile.jpg"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Buscar marmitas",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 275,
                  child: FutureBuilder(
                    future: controller.getItems(),
                    initialData: List<Item>(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Item>> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          break;

                        case ConnectionState.done:
                          return ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, id) {
                              return LargeContainer(item: snapshot.data[id]);
                            },
                          );
                          break;
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                          color: Colors.grey[100]),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.symmetric(horizontal: 9.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: LinearGradient(
                              colors: [Colors.orangeAccent, Colors.pinkAccent]),
                        ),
                        child: Text(
                          "Venda",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "# Marmitas mais vendidas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                CategoriesList(),
                SizedBox(height: 15.0),
                Container(
                  height: 181,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurantList.length,
                    itemBuilder: (context, id) {
                      return SmallContainer(text: restaurantList[id]);
                    },
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LargeContainer extends StatelessWidget {
  final Item item;

  const LargeContainer({Key key, @required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RestaurantPage(item: item),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(0, 3),
              color: Colors.grey[300],
            ),
          ],
        ),
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              // child: Image.asset("assets/images/marmita2.png"),
              child: Image.network(item?.imgUrl),
              borderRadius: BorderRadius.circular(15.0),
            ),
            SizedBox(
              height: 9.0,
            ),
            Text(
              item?.title ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            SizedBox(
              height: 9.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.pin_drop,
                  color: Colors.grey[400],
                ),
                Text(
                  "${item?.range}km até o local",
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 3,
                  child: FittedBox(
                    child: StarDisplay(
                      value: 5,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SmallContainer extends StatelessWidget {
  final Item item;
  final String text;
  const SmallContainer({Key key, this.text, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, 'restaurant'),
        child: Container(
          height: 179,
          width: MediaQuery.of(context).size.width / 2.5,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                offset: Offset(0, 3),
                color: Colors.grey[300],
              ),
            ],
          ),
          child: ListView(
            children: <Widget>[
              ClipRRect(
                child: Image.asset("assets/images/marmita2.png"),
                borderRadius: BorderRadius.circular(15.0),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 9.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${item?.star?.toStringAsFixed(2) ?? 5.toStringAsFixed(1)}",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    color: Colors.red[400],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {
  final bool active;
  final String title;
  final Function onTap;
  const MyCustomButton({Key key, this.active, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 115,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: !active ? Border.all(color: Colors.grey[100]) : null,
            borderRadius: BorderRadius.circular(21.0),
            gradient: active
                ? LinearGradient(colors: [Colors.yellow, Colors.orange])
                : null,
            color: active ? null : Colors.white,
            boxShadow: [
              active
                  ? BoxShadow(
                      color: Colors.yellow,
                      offset: Offset(0, 3),
                      blurRadius: 5.0,
                    )
                  : BoxShadow()
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 21.0, vertical: 5.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
          child: Text(
            title,
            style: TextStyle(color: active ? Colors.white : Colors.grey[500]),
          ),
        ),
      ),
    );
  }
}

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: ListView.builder(
        itemCount: buttonsTitle.length,
        itemBuilder: (BuildContext context, int id) {
          return MyCustomButton(
            title: buttonsTitle[id],
            active: id == _active ? true : false,
            onTap: () {
              setState(() {
                _active = id;
              });
            },
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
