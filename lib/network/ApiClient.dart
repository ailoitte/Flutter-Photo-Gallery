

import 'dart:convert';

import 'package:photo_gallery/utils/Constants.dart';
import 'dart:async';
import 'package:http/http.dart';

/// Function to get pics from the internet
Future<Map> getPics(String searchTerm) async {
  final String url = "https://pixabay.com/api/?key=${Constants.API_KEY}&q=$searchTerm&image_type=photo&pretty=true";
  print(url);
  final response = await get(url);
  return json.decode(response.body);
}