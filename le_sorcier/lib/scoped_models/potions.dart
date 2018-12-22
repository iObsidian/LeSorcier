import 'package:le_sorcier/models/potion.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PotionsModel {

  void saveNewPotion(Potion potion) {
    final Map<String, dynamic> productData = {
      'title': potion.title,
      'user': potion.user,
      'description': potion.description,
    };

    http.post('https://le-sorcier.firebaseio.com/products.json',
        body: jsonEncode(productData));
  }
}
