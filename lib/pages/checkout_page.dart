import 'package:dmobility/pages/success_page.dart';
import 'package:dmobility/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dmobility/constants/colors.dart';
import 'package:dmobility/model/cart_model.dart';
import 'package:dmobility/model/food_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatefulWidget {
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  var titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);

    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16),
              SafeArea(
                child: InkWell(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.arrow_back_ios)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('My Cart', style: titleStyle),
              ),
              TextButton(
                child: Text('+ Add to order',style: TextStyle(fontSize: 25),),
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(
                height: 50,
              ),
              ListView.builder(
                itemCount: cart.cartItems.length,
                shrinkWrap: true,
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return buildCartItemList(cart, cart.cartItems[index]);
                },
              ),
              buildPriceInfo(cart),
              SizedBox(
                height: 50,
              ),
              checkoutButton(cart, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPriceInfo(Cart cart) {
    final titleStyle2 = TextStyle(fontSize: 18, color: Colors.black45);
    double total = 0;
    for (CartModel cart in cart.cartItems) {
      total += (cart.menu?.price ?? 0) * (cart.quantity ?? 0);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Total pay:', style: titleStyle2),
        Text('\KES ${total.toStringAsFixed(2)}', style: titleStyle),
      ],
    );
  }

  Widget checkoutButton(cart, context) {
    final titleStyle1 = TextStyle(fontSize: 16 ,color: Colors.black);
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 64),
      child: Center(
        child: ElevatedButton(
          child: Text('Checkout', style: titleStyle1),
          onPressed: () {
            sendDummyPostRequest(cart);
            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => SuccessScreen(),
            ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: mainColor, // background color
            padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
            shape: StadiumBorder(),
          ),
        ),

      ),
    );
  }

  Widget buildCartItemList(Cart cart, CartModel cartModel) {
    var titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child:

              Image.network(
                cartModel.menu!.image,
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
          ),
          Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 50,
                  child: Text(
                    cartModel.menu!.title,
                    style: titleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () => cart.removeItem(cartModel),
                      child: Icon(Icons.remove_circle),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('${cartModel.quantity}', style: titleStyle),
                    ),
                    InkWell(
                      onTap: () => cart.increaseItem(cartModel),
                      child: Icon(Icons.add_circle),
                    ),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 70,
                  child: Text(
                    '\KES ${cartModel.menu?.price}',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                    textAlign: TextAlign.end,
                  ),
                ),
                Card(
                  shape: roundedRectangle,
                  color: mainColor,
                  child: InkWell(
                    onTap: () => cart.removeAllInList(cartModel.menu!),
                    customBorder: roundedRectangle,
                    child: Icon(Icons.close),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}