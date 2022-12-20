import 'package:finalproject_front/controller/subscribe_controller.dart';
import 'package:finalproject_front/dummy_models/subscribe_list_resp_dto.dart';
import 'package:finalproject_front/pages/subscribe/model/subscribe_page_model.dart';
import 'package:finalproject_front/pages/subscribe/model/subscribe_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class SubscribePage extends ConsumerWidget {
  final userId;

  SubscribePage({required this.userId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SubscribePageModel? model = ref.watch(subscribePageViewModel(userId));
    Logger().d("model : ${model}");
    SubscribeController subscribeCT = ref.read(subscribeController);
    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
        appBar: _buildAppbar(),
        body: ListView.builder(
            shrinkWrap: true, //리스트 자식 높이 크기의 합 만큼으로 영역을 고정 시켜준다.
            itemCount: model?.subscribeList.length,
            itemBuilder: ((BuildContext context, int index) {
              return _buildSubscribeLesson(context, ref, index, model, subscribeCT);
            })));
  }

  Padding _buildSubscribeLesson(BuildContext context, WidgetRef ref, int index, SubscribePageModel? model, SubscribeController subscribeCT) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 10, bottom: 8, left: 10),
      child: InkWell(
        onTap: () {
          subscribeCT.moveDetailPage(lessonId: model!.subscribeList[index].lessonId);
          Logger().d("좋아요 레슨디테일 이동실행onTop");
        },
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://picsum.photos/198",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 230,
                        height: 50,
                        child: Text(
                          // "${model?.subscribeList.subscribes[index].lesson.name}", //이름
                          "${model?.subscribeList[index].lessonName}", //이름
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "|  4개의 평가",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${model?.subscribeList[index].lessonPrice}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                            size: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar _buildAppbar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1.0,
    title: Text(
      "찜목록",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
  );
}
