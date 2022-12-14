import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/subscribe/model/subscribe_page_view_model.dart';
import 'package:finalproject_front/service/subscribe_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final subscribeController = Provider<SubscribeController>((ref) {
  // Controller + HttpRepo
  return SubscribeController(ref);
});

class SubscribeController {
  final mContext = navigatorKey.currentContext!;
  Ref _ref;
  SubscribeController(this._ref);
  final SubscribeService subscribeService = SubscribeService();

  Future<void> refreshSubscribePage() async {
    Logger().d("좋아요컨트롤러 실행");
    // _ref.read(subscribePageViewModel.)
  }
}
