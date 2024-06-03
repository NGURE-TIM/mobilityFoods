import 'package:flutter/material.dart';
import 'package:dmobility/model/food_model.dart';
import 'package:dmobility/model/menu_model.dart' ;

import '../localDb/Isar/menus.dart';

class CartModel {
  MenuIsar? menu;
  int? quantity;

  CartModel({this.menu, this.quantity});
}

class Cart extends ChangeNotifier {
  List<CartModel> items = [];
  List<CartModel> get cartItems => items;

  void addItem(CartModel cartModel) {
    for (CartModel cart in cartItems) {
      if (cartModel.menu?.title == cart.menu?.title) {
        cartItems[cartItems.indexOf(cart)].quantity = (cart.quantity ?? 0) + 1;
        notifyListeners();
        return;
      }
    }
    items.add(cartModel);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }

  void removeItem(CartModel cartModel) {
    int index = cartItems.indexOf(cartModel);
    if (index != -1) {
      if ((cartItems[index].quantity ?? 0) <= 1) {
        return;
      }
      cartItems[index].quantity = (cartItems[index].quantity ?? 0) - 1;
      notifyListeners();
    }
  }

  void increaseItem(CartModel cartModel) {
    int index = cartItems.indexOf(cartModel);
    if (index != -1) {
      cartItems[index].quantity = (cartItems[index].quantity ?? 0) + 1;
      notifyListeners();
    }
  }

  void removeAllInList(MenuIsar menu ) {
    cartItems.removeWhere((f) => f.menu?.title == menu.title);
    notifyListeners();
  }
}


