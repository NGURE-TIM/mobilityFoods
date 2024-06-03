import 'package:isar/isar.dart';
//import 'package:isar_generator/isar_generator.dart';
import 'package:isar_flutter_libs/isar_flutter_libs.dart';

import '../../model/menu_model.dart';

part 'menus.g.dart';

@Collection()
class MenuIsar {
  Id id = Isar.autoIncrement;

  late int price;
  late String title;
  late String restaurantChain;
  late String image;

  MenuIsar({
    required this.price,
    required this.title,
    required this.restaurantChain,
    required this.image,
  });
}
Future<void> insertMenusIntoDb(Isar isar, List<Menu> menus) async {

  final menuIsarList = menus.map((menu) => MenuIsar(
    title: menu.title,
    restaurantChain: menu.restaurantChain,
    image: menu.image,
    price: menu.id,
  )).toList();

  await isar.writeTxn(() async {
    for (var menuIsar in menuIsarList) {
      await isar.menuIsars.put(menuIsar);
    }
  });

}