import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/category/components/category_page_model.dart';
import 'package:finalproject_front/service/category_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

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
    Logger().d("viewModel잘들어오는지?");
    Logger().d("${categoryId}는 viewModel  Id");
    ResponseDto responseDto = await categoryService.fetchCategoryList(categoryId);
    // if (responseDto.data == null) {
    //   state =
    // }
    Logger().d("상태메시지 : ${responseDto.msg}");
    Logger().d("상태데이터 : ${responseDto.data}");
    Logger().d("상태코드 : ${responseDto.statusCode}");

    Logger().d("상태메시지 : ${responseDto.msg}");
    Logger().d("상태데이터 : ${responseDto.data}");
    Logger().d("상태코드 : ${responseDto.statusCode}");

    if (responseDto.statusCode < 300) {
      state = CategoryPageModel(responseDto.data);
    }
  }
}
