import 'package:finalproject_front/pages/lesson/lesson_detail/components/lesson_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StackPage extends StatelessWidget {
  const StackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _first(),
          _appbar(),
          _second(),
        ],
      ),
    );
  }

  Widget _first() {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("StackPage"),
        );
      },
    );
  }

  Widget _second() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BottomBar(),
      ],
    );
  }

  Widget _appbar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BottomBar(),
      ],
    );
  }
}
