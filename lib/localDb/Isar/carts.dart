import 'package:dmobility/model/cart_model.dart';
import 'package:isar/isar.dart';
//import 'package:isar_generator/isar_generator.dart';
import 'package:isar_flutter_libs/isar_flutter_libs.dart';

import '../../model/menu_model.dart';
import 'menus.dart';

part 'carts.g.dart';

@Collection()
class CartIsar {
  Id id = Isar.autoIncrement;
  late int menuId;
  int? quantity;


  CartIsar({
    required this.menuId,
    required this.quantity,
  });
}
Future<void> addMenuItemToCart(MenuIsar menuItem, int quantity, Isar isar) async {
  await isar.writeTxn(() async {
    final existingCartItem = await isar.cartIsars.filter()
        .menuIdEqualTo(menuItem.id)
        .findFirst();

    if (existingCartItem != null) {

      existingCartItem.quantity = (existingCartItem.quantity ?? 0) + quantity;
      await isar.cartIsars.put(existingCartItem);
    } else {

      final newCartItem = CartIsar(menuId: menuItem.id, quantity: quantity);
      await isar.cartIsars.put(newCartItem);
    }
  });
  var items = await isar.cartIsars.where().findAll();
  print(items);
}

