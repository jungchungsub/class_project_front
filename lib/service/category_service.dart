import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/core/util/response_util.dart';
import 'package:finalproject_front/dto/response/category_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class CategoryService {
  final HttpConnector httpConnector = HttpConnector();

  Future<ResponseDto> fetchCategoryList(int categoryId, {required String drowdownValue}) async {
    Logger().d("통신 전:  ${categoryId}");

    // ranking, recommand, recent
    String sort = "ranking";
    // 인기순, 추천순, 등록순
    if (drowdownValue == "추천순") {
      sort = "ranking";
    } else if (drowdownValue == "인기순") {
      sort = "recommand";
    } else {
      sort = "recent";
    }

    Response response = await httpConnector.get(path: "/api/category/${categoryId}?sort=$sort");
    Logger().d(response.body);
    ResponseDto responseDto = toResponseDto(response);

    if (responseDto.statusCode < 300) {
      List<dynamic> mapList = responseDto.data;
      List<CategoryRespDto> CategoryList = mapList.map((e) => CategoryRespDto.fromJson(e)).toList();
      responseDto.data = CategoryList;
    }

    return responseDto;
  }
}
