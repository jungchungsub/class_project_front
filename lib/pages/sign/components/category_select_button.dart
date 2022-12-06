import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CategorySelectButton extends StatefulWidget {
  const CategorySelectButton({super.key});

  @override
  State<CategorySelectButton> createState() => _CategorySelectButtonState();
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });
}

class _CategorySelectButtonState extends State<CategorySelectButton> {
  // ignore: prefer_final_fields
  static List<dynamic> _category = [
    // 리스트
    Category(id: 1, name: "뷰티"),
    Category(id: 2, name: "운동"),
    Category(id: 3, name: "댄스"),
    Category(id: 4, name: "뮤직"),
    Category(id: 5, name: "미술"),
    Category(id: 6, name: "문학"),
    Category(id: 7, name: "공예"),
    Category(id: 8, name: "기타"),
  ];
  final _items = _category.map((category) => MultiSelectItem<Category>(category, category.name)).toList(); // 선택 가능한 항목을 보여줌 -> 리스트를 깊은 복사

  List<dynamic> _selectCategory = []; // 담을 공간
  final _multiSelectKey = GlobalKey<FormFieldState>();
  @override
  void initState() {
    // 선택된 아이템을 리스트에 담아줌
    _selectCategory = _category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField(
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
        _selectCategory = results;
        print(_selectCategory);
      },
    );
  }
}
