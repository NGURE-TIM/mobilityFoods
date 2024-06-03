import 'package:dmobility/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:dmobility/model/cart_model.dart';
import 'package:dmobility/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:isar/isar.dart';
import 'package:isar_flutter_libs/isar_flutter_libs.dart';
import 'localDb/Isar/carts.dart';
import 'localDb/Isar/menus.dart';
import 'model/menu_model.dart';
import 'package:path_provider/path_provider.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();


  final isar = await Isar.open([MenuIsarSchema,CartIsarSchema], directory: dir.path);
try{
  final menus =await fetchMenus();
  await insertMenusIntoDb(isar, menus);
}
catch(e){
  print(e);
}


  runApp(MyApp(isar));

}


class MyApp extends StatelessWidget {
  Isar isar;
  MyApp(this.isar);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),

      child: MaterialApp(
        title: 'Mobility Foods',
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(isar),
      ),
    );
  }
}
