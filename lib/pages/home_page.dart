import 'package:flutter/material.dart';
import 'package:dmobility/constants/colors.dart';
import 'package:dmobility/model/cart_model.dart';
import 'package:dmobility/model/food_model.dart';
import 'package:dmobility/widgets/cart_bottom_sheet.dart';
import 'package:dmobility/widgets/menu_card.dart';
import 'package:provider/provider.dart';
import 'package:isar/isar.dart';
import 'package:dmobility/services/networking.dart';

import '../localDb/Isar/menus.dart';
import '../model/menu_model.dart';

class MyHomePage extends StatefulWidget {
 late  Isar isar;
MyHomePage(this.isar);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<MenuIsar>> menusFuture;

  @override
  void initState() {
    super.initState();
  menusFuture = fetchMenusFromDb();
  }
  Future<List<MenuIsar>> fetchMenusFromDb() async {
    return await widget.isar.menuIsars.where().findAll();
  }
  int value = 0;

  showCart() {
    showModalBottomSheet(
      shape: roundedRectangle32,
      context: context,
      builder: (context) => CartBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: <Widget>[
            buildAppBar(),
            buildFoodFilter(),
            buildFoodList(widget.isar),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    int items = 0;
    Provider.of<Cart>(context).cartItems.forEach((cart) {
      items += cart.quantity!;
    });
    return SafeArea(
      child: Row(
        children: <Widget>[
          Text('Mobility Foods', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
          Spacer(),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          Stack(
            children: <Widget>[
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: showCart),
              Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: mainColor),
                  child: Text(
                    '$items',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFoodFilter() {
    return Container(
      height: 50,
      //color: Colors.red,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: List.generate(foodTypes.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              selectedColor: mainColor,
              labelStyle: TextStyle(color: value == index ? Colors.white : Colors.black),
              label: Text(foodTypes[index]),
              selected: value == index,
              onSelected: (selected) {

              },
            ),
          );
        }),
      ),
    );
  }

  Widget buildFoodList(Isar isar) {
    return Expanded(
      child: FutureBuilder<List<MenuIsar>>(
        future: menusFuture,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('${snapshot.error}'));
          } else {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 6,
                mainAxisSpacing: 20 ,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return Menucard(snapshot.data![index] ,isar);
              },
            );
          }
        },
      ),
    );
  }
}
