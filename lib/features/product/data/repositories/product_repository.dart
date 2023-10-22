import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductRepository {
  String baseUrl = 'https://api.escuelajs.co/api/v1/products';
  String showPath = '?offset=0&limit=10#';

  Future<List<Product>> getProducts() async {
    final url = Uri.parse('$baseUrl/$showPath');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        return result.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (error) {
      throw Exception('Error in the request: $error');
    }
  }
}
