import 'package:http/http.dart' as http;
import 'package:dmobility/model/menu_model.dart' ;
import 'dart:convert';

import '../model/cart_model.dart';

Future<List<Menu>> fetchMenus() async {
  try {
    final Uri uri = Uri.parse('https://api.spoonacular.com/food/menuItems/search?query=food&number=90&apiKey=7cd5f19058384d7cb700ed56d00dc4e7');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic>? menuItemsJson = jsonResponse['menuItems'];

      if (menuItemsJson != null) {
        final List<Menu> menuItems = menuItemsJson.map((json) => Menu.fromJson(json)).toList();
        print(menuItems);
        return menuItems;
      } else {
     ;
        throw Exception('No menu items found.');
      }
    } else if(response.statusCode == 402) {
      throw Exception('Api limits exceeded!!! Upgrade your plan.');
    } else {

      throw Exception('Mobility foods db unable to load items, try again later.');
    }
  } catch (e) {

    throw Exception('Error fetching menu items: $e');
  }
}



 sendDummyPostRequest(Cart cart) async {
  List<Map<String, dynamic>> postData = [];

  for (CartModel item in cart.cartItems) {
    var title = item.menu?.title;
    var quantity = item.quantity;

    if (title != null && quantity != null) {

      postData.add({
        'menu_title': title,
        'quantity': quantity,
      });
    }
  }

  var url = Uri.parse(
      'https://my.api.mockaroo.com/menu.json?key=60c78aa0&__method=POST');

  try {
    var response = await http.post(
      url,
      body: json.encode(postData),
      headers: {'Content-Type': 'application/json'},
    );


    if (response.statusCode == 201) {
      print('Dummy POST request successful!');
      print('Response body: ${response.body}');
    } else {
      print('Failed to send dummy POST request.');
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error sending dummy POST request: $e');
  }
}
