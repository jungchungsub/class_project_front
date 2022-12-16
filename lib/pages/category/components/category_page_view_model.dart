import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/category/components/category_page_model.dart';
import 'package:finalproject_front/service/category_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryPageViewModel = StateNotifierProvider.family.autoDispose<CategoryPageViewModel, CategoryPageModel?, int>((ref, cateogryId) {
  return CategoryPageViewModel(null, cateogryId)..notifyViewModel();
});

class CategoryPageViewModel extends StateNotifier<CategoryPageModel?> {
  final CategoryService categoryService = CategoryService();
  final mContext = navigatorKey.currentContext;
  final int categoryId;
  CategoryPageViewModel(super.state, this.categoryId);

  Future<void> notifyViewModel() async {
    String? jwtToken;
    ResponseDto responseDto = await categoryService.fetchCategoryList(categoryId, jwtToken);

    if (responseDto.statusCode < 300) {
      state = CategoryPageModel(responseDto.data);
    }
  }
}
