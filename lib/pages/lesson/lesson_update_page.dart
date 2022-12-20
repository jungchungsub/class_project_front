// import 'package:finalproject_front/controller/lesson_controller.dart';
// import 'package:finalproject_front/dto/request/lesson_update_info.dart';
// import 'package:finalproject_front/dto/request/lesson_update_req_dto.dart';


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logger/logger.dart';

// class LessonUpdatePage extends ConsumerWidget {
//   LessonUpdatePage({required this.model, Key? key}) : super(key: key);

//   LessonUpdateInfo model;
//   LessonInsertReqDto lessonUpdateReqDto = LessonInsertReqDto.single();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final lessonCT = ref.read(lessonController);

//     Logger().d("업데이트 페이지 ${model.name}");

//     return Scaffold(
//       appBar: _buildAppbar(context),
//       // body: LessonUpdateForm(),
//     );
//   }

//   AppBar _buildAppbar(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 1.0,
//       leading: IconButton(
//           icon: Icon(
//             CupertinoIcons.back,
//             color: Colors.black,
//             size: 30,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           }),
//       title: Text(
//         "클래스 등록하기",
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       centerTitle: true,
//     );
//   }
// }
