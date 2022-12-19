import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/core/util/response_util.dart';
import 'package:finalproject_front/dto/response/category_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class CategoryService {
  final HttpConnector httpConnector = HttpConnector();

  Future<ResponseDto> fetchCategoryList(int categoryId) async {
    Logger().d("통신 전:  ${categoryId}");
    Response response = await httpConnector.get(path: "/api/category/${categoryId}");
    Logger().d("통신 후:  ${categoryId}");
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("상태값 확인 ${responseDto.statusCode}");

    if (responseDto.statusCode < 300) {
      List<dynamic> mapList = responseDto.data;
      Logger().d("mapList :${mapList}");
      List<CategoryRespDto> CategoryList = mapList.map((e) => CategoryRespDto.fromJson(e)).toList();
      Logger().d("categoryList : ${CategoryList}");
      responseDto.data = CategoryList;
      Logger().d("responseDto.data : ${responseDto.data}");
    }
    return responseDto;
  }
}
