import 'package:finalproject_front/controller/lesson_controller.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:finalproject_front/pages/lesson/components/lesson_Insert_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LessonInsertPage extends ConsumerWidget {
  LessonInsertPage({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonCT = ref.read(lessonController);
    return Scaffold(
      appBar: _buildAppbar(context),
      body: LessonInsertForm(),
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
