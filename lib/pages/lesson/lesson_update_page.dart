import 'package:finalproject_front/controller/lesson_controller.dart';
import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/request/lesson_req_dto.dart';
import 'package:finalproject_front/dto/request/lesson_update_info.dart';
import 'package:finalproject_front/pages/lesson/components/lesson_update_form.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/model/lesson_detail_page_model.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/model/lesson_detail_page_view_model.dart';
import 'package:finalproject_front/pages/lesson/lesson_master_list/model/lesson_master_list_model.dart';
import 'package:finalproject_front/pages/lesson/lesson_master_list/model/lesson_master_list_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class LessonUpdatePage extends ConsumerWidget {
  LessonUpdatePage({required this.lessonId, Key? key}) : super(key: key);

  final int lessonId;
  LessonUpdateReqDto lessonUpdateReqDto = LessonUpdateReqDto.single();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LessonDetailPageModel? model = ref.watch(lessonDetailPageViewModel(lessonId));
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: _buildAppbar(context),
      body: LessonUpdateForm(model: model, lessonUpdateReqDto: lessonUpdateReqDto),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(
        "클래스 등록하기",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
