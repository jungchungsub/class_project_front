import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../dto/request/category_req_dto.dart';

class CategorySelectButton extends StatefulWidget {
  const CategorySelectButton({super.key});

  @override
  State<CategorySelectButton> createState() => _CategorySelectButtonState();
}

class _CategorySelectButtonState extends State<CategorySelectButton> {
  // ignore: prefer_final_fields
  static List<CategoryReqDto> _category = [
    // 리스트
    CategoryReqDto(id: 1, name: "뷰티"),
    CategoryReqDto(id: 2, name: "운동"),
    CategoryReqDto(id: 3, name: "댄스"),
    CategoryReqDto(id: 4, name: "뮤직"),
    CategoryReqDto(id: 5, name: "미술"),
    CategoryReqDto(id: 6, name: "문학"),
    CategoryReqDto(id: 7, name: "공예"),
    CategoryReqDto(id: 8, name: "기타"),
  ];

  List<int> _categoryIds = [1, 2, 3, 4, 5, 6, 7, 8];
  final _items = _category.map((category) => MultiSelectItem<CategoryReqDto>(category, category.name)).toList(); // 선택 가능한 항목을 보여줌 -> 리스트를 깊은 복사

  List<CategoryReqDto>? _selectCategory = []; // null이 가능하다, 초기값은 null이다.
  final _multiSelectKey = GlobalKey<FormFieldState>();
  @override
  void initState() {
    // 선택된 아이템을 리스트에 담아줌
    _selectCategory = _category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField<CategoryReqDto>(
      //버튼에 사용할 value타입을 Category 오브젝트 타입임을 선언
      items: _items,
      title: Text("관심사"),
      itemsTextStyle: TextStyle(color: Colors.black),
      isDismissible: true,
      cancelText: Text(
        "취소",
        style: TextStyle(fontSize: 18),
      ),
      confirmText: Text(
        "선택",
        style: TextStyle(fontSize: 18),
      ),
      selectedItemsTextStyle: TextStyle(color: gPrimaryColor),
      decoration: BoxDecoration(
        border: Border.all(
          color: gClientColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      buttonIcon: Icon(
        CupertinoIcons.plus_circle,
        color: gClientColor,
        size: 35,
      ),
      buttonText: Text(
        "관심사를 선택해 주세요.",
        style: TextStyle(fontSize: 16, color: gSubTextColor),
      ),

      onConfirm: (results) {
        setState(() {
          _selectCategory = results;
        });
        print(_selectCategory);
      },
    );
  }
}
