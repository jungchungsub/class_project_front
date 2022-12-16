import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/core/util/response_util.dart';
import 'package:finalproject_front/dto/response/category_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class CategoryService {
  final HttpConnector httpConnector = HttpConnector();

  Future<ResponseDto> fetchCategoryList(int categoryId) async {
    Response response = await httpConnector.get(path: "/api/category/${categoryId}");

    ResponseDto responseDto = toResponseDto(response);
    Logger().d(responseDto.statusCode);
    if (responseDto.statusCode < 300) {
      responseDto.data = CategoryRespDto.fromJson(responseDto.data);
    }
    return responseDto;
  }
}
