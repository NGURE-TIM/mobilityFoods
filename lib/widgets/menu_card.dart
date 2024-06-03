import 'package:dmobility/localDb/Isar/carts.dart';
import 'package:flutter/material.dart';
import 'package:dmobility/constants/colors.dart';
import 'package:dmobility/model/cart_model.dart';
import 'package:dmobility/model/food_model.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import '../localDb/Isar/menus.dart';
import 'package:dmobility/model/menu_model.dart' ;



class Menucard extends StatefulWidget {
  final Isar isar;
  final MenuIsar menu;
  Menucard(this.menu ,this.isar);

  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<Menucard> {
  MenuIsar get menu => widget.menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          buildImage(),
          buildTitle(),
          buildPriceInfo(),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Card(
      shape: roundedRectangle,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Image.network(
          menu.image,
          fit: BoxFit.fill,
          height: 100,
          loadingBuilder: (context, Widget child, ImageChunkEvent? progress) {
            if (progress == null) return child;
            return Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(
                  value: progress.expectedTotalBytes != null ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes! : null,
                ));
          },
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/placeholder.jpg',
              fit: BoxFit.fill,
              height: 100,
            );
          },
        ),
      ),
    );
  }


  Widget buildTitle() {
    return Container(
  height: 80,
      padding: const EdgeInsets.only(top: 12.0, left: 8, right: 16),
      child: Column(
        children: [
          Text(
            menu.title ?? 'Menu item not found',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            menu.restaurantChain ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500,color: mainColor),
          ),
        ],
      )
    );
  }

  Widget buildPriceInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '\KES ${menu.price}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Card(
            margin: EdgeInsets.only(right: 8),
            shape: roundedRectangle,
            color: mainColor,
            child: InkWell(
              onTap: () => addItemToCart(context ,widget.isar),
              customBorder: roundedRectangle,
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }


  addItemToCart(BuildContext context ,Isar isar) async{
    final snackBar = SnackBar(
      elevation: 0,
      backgroundColor: mainColor.withOpacity(0.8),
      content: Text('${menu.title} added to cart', style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w800),),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    addMenuItemToCart(menu, 1, isar);//persists the items into cart
    print(menu.title);
  CartModel cartModel = CartModel( menu:menu, quantity: 1);
   Provider.of<Cart>(context, listen: false).addItem(cartModel);
  }
}
