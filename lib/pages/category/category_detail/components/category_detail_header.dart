import 'package:flutter/material.dart';

class CategoryDetailHeader extends StatefulWidget {
  const CategoryDetailHeader({Key? key}) : super(key: key);

  @override
  State<CategoryDetailHeader> createState() => _CategoryDetailHeaderState();
}

class _CategoryDetailHeaderState extends State<CategoryDetailHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
    );
  }
}
