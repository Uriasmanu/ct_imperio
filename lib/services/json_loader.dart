import 'dart:convert';
import 'package:flutter/services.dart';

class JsonLoader {
  static Future<Map<String, dynamic>> load() async {
    // Carrega o arquivo JSON da pasta assets
    String jsonString = await rootBundle.loadString('assets/mocks/texts.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }
}
