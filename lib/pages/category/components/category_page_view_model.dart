import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/category/components/category_page_model.dart';
import 'package:finalproject_front/service/category_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final categoryPageViewModel = StateNotifierProvider.family.autoDispose<CategoryPageViewModel, CategoryPageModel, int>((ref, cateogryId) {
  return CategoryPageViewModel(CategoryPageModel(null), cateogryId)..notifyViewModel("등록순");
});

class CategoryPageViewModel extends StateNotifier<CategoryPageModel> {
  final CategoryService categoryService = CategoryService();
  final mContext = navigatorKey.currentContext;
  final int categoryId;

  CategoryPageViewModel(super.state, this.categoryId);

  Future<void> notifyViewModel(String dropdownValue) async {
    String? jwtToken;
    ResponseDto responseDto = await categoryService.fetchCategoryList(categoryId, drowdownValue: dropdownValue);
    if (responseDto.statusCode < 400) {
      state = CategoryPageModel(responseDto.data);
    }
  }
}
