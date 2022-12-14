// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../constants.dart';
// import '../../../size.dart';

// class ProfileInsertForm extends ConsumerStatefulWidget {
//   const ProfileInsertForm({super.key});

//   @override
//   ConsumerState<ProfileInsertForm> createState() => _ProfileInsertFormState();
// }

// class _ProfileInsertFormState extends ConsumerState<ProfileInsertForm> {
//   @override
//   void initState() {
//     super.initState();
//     scrollController = new ScrollController();
//   }

//   XFile? pickedFile;
//   ImagePicker imgpicker = ImagePicker();
//   XFile? _imagefile;
//   late List<String>? profileImage;
//   final _formKey = GlobalKey<FormState>(); // 글로벌 key
//   late ScrollController scrollController;

//   openImages() async {
//     try {
//       var pickedfile = await imgpicker.pickImage(source: ImageSource.gallery);
//       //you can use ImageCourse.camera for Camera capture
//       if (pickedfile != null) {
//         _imagefile = pickedfile;
//         setState(() {}); // 상태 초기화
//         Uint8List? data = await _imagefile?.readAsBytes();
//         List<String> profileImage = [base64Encode(data!)];
//         return this.profileImage = profileImage;
//       } else {
//         print("No image is selected.");
//       }
//     } catch (e) {
//       print("error while picking file.");
//     }
//   }

//   void scrollAnimate() {
//     Future.delayed(Duration(milliseconds: 600), () {
//       //0.6초 이후 키보드 올라옴
//       // ViewInsets은 현재 페이지에서 내가 컨트롤 할 수 없는 영역을 뜻함,
//       // bottom은 키보드가 아래에서 올라오기 때문
//       scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom,
//           duration: Duration(microseconds: 100), // 0.1초 이후 field가 올라간다.
//           curve: Curves.easeIn); //Curves - 올라갈때 애니메이션
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey, // 해당 키로 Form의 상태를 관리 한다.
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _buildTextField(
//                 scrollAnimate,
//                 fieldTitle: "아이디",
//                 hint: "아이디를 입력해주세요",
//                 lines: 1,
//                 fieldController: _id,
//               ),

//               SizedBox(height: gap_m),
//               CustomTextField(
//                 scrollAnimate,
//                 fieldTitle: "비밀번호",
//                 hint: "비밀번호를 입력해주세요",
//                 lines: 1,
//                 fieldController: _password,
//               ),
//               SizedBox(height: gap_m),
//               CustomTextField(
//                 scrollAnimate,
//                 fieldTitle: "이메일",
//                 hint: "이메일를 입력해주세요",
//                 lines: 1,
//                 fieldController: _email,
//               ),
//               SizedBox(height: gap_m),
//               CustomTextField(
//                 scrollAnimate,
//                 fieldTitle: "휴대폰번호",
//                 hint: "휴대폰번호를 입력해주세요",
//                 lines: 1,
//                 fieldController: _phoneNum,
//               ),
//               SizedBox(height: gap_m),
//               Container(
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "관심사 선택",
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(height: gap_m),
//                     CategorySelectButton()
//                   ],
//                 ),
//               ),
//               //개인 정보 제공 동의 폼 필요 -> API
//               SizedBox(height: gap_xl),
//               ElevatedButton(
//                 onPressed: () {
//                   uc.joinUser(
//                       username: _id.text.trim(),
//                       password: _password.text.trim(),
//                       email: _email.text.trim(),
//                       phoneNum: _phoneNum.text.trim(),
//                       role: role);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: gButtonOffColor,
//                   minimumSize: Size(getScreenWidth(context), 60),
//                 ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "회원가입 완료",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Container _buildTextField(Function scrollAnimate, {
//    required String fieldTitle,
//    required String hint,
//     String? subTitle,
//    required int lines,
//    required TextEditingController fieldController
//   }
//   ) {
//     return Container(
//       child: Column(
//         children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text.rich(
//               TextSpan(
//                 children: [
//                   TextSpan(
//                     text: "${fieldTitle}",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   if (subTitle != null)
//                     TextSpan(
//                       text: "${subTitle}",
//                       style: TextStyle(color: gSubTextColor, fontSize: 10, fontWeight: FontWeight.bold),
//                     )
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: gap_m),
//           TextFormField(
//             onTap: (() {
//               scrollAnimate;
//             }),
//             // onChanged: (value) { 데이터 저장해야함.

//             // },
//             controller: fieldController,
//             keyboardType: TextInputType.multiline,
//             maxLines: lines,
//             decoration: InputDecoration(
//               hintText: "${hint}",
//               hintStyle: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.normal,
//                 color: gSubTextColor,
//               ),
//               //3. 기본 textFormfield 디자인 - enabledBorder
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: gClientColor, width: 3.0),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               //마우스 올리고 난 후 스타일
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: gClientColor, width: 3.0),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
