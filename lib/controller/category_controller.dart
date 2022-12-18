import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/category/category_detail_page.dart';
import 'package:finalproject_front/service/category_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categorryController = Provider<CategoryController>((ref) {
  // Controller + HttpRepo
  return CategoryController(ref);
});

class CategoryController {
  final mContext = navigatorKey.currentContext!;
  Ref _ref;
  CategoryController(this._ref);
  final CategoryService categoryService = CategoryService();
}
