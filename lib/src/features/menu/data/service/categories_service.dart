import 'dart:convert';

import 'package:flutter_kompas_app_clone/src/features/menu/domain/category_model.dart';
import 'package:flutter_kompas_app_clone/src/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class CategoriesService {
  Future<List<CategoryModel>> getCategories() async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrlApi/categories?populate=*'),
      );

      if (res.statusCode == 200) {
        return List<CategoryModel>.from(
          jsonDecode(res.body)['data'].map(
            (categories) => CategoryModel.fromJson(categories),
          ),
        ).toList();
      }

      throw jsonDecode(res.body)['errors']['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CategoryModel>> getDataCategories() async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrlApi/categories?populate=news'),
      );

      if (res.statusCode == 200) {
        return List<CategoryModel>.from(
          jsonDecode(res.body)['data'].map(
            (categories) => CategoryModel.fromJson(categories),
          ),
        ).toList();
      }

      throw jsonDecode(res.body)['errors']['message'];
    } catch (e) {
      rethrow;
    }
  }
}
