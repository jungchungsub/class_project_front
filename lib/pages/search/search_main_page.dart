import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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
          "검색",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          SizedBox(
            width: 15,
          )
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search),
                hintText: "검색어를 입력해주세요.",
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: gClientColor,
                    width: 1,
                  ),
                ),
              ),
            )));
  }

  OutlinedButton _buildCommendSearch(BuildContext context, String textCategory, String routePath) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, routePath);
      },
      child: Row(
        children: [
          Text(
            "${textCategory}",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
      style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      )),
    );
  }
}
