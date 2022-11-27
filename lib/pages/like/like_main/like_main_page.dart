import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeMainPage extends StatefulWidget {
  const LikeMainPage({Key? key}) : super(key: key);

  @override
  State<LikeMainPage> createState() => _LikeMainPageState();
}

class _LikeMainPageState extends State<LikeMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 20),
            child: Text("필터", style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ],
      ),
      body: ListView(
        children: [
          _likelist(),
          _likelist(),
          _likelist(),
          _likelist(),


        ],
      ),
    );
  }



  Padding _likelist() {
    return Padding(
          padding: const EdgeInsets.only(top: 16,right: 8,bottom: 8,left: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8,top: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/home1.jpg",
                    fit: BoxFit.cover,
                    width: 110,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("깔끔하고 아름다운aaaa2",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                        overflow: TextOverflow.ellipsis,maxLines: 2,),
                      Row(
                        children: [
                          Icon(CupertinoIcons.star_fill,color: Colors.yellow,size:16,),
                          SizedBox(width: 8,),
                          Text("|   45개의 평가",style: TextStyle(fontSize: 14),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("50,000원",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Icon(CupertinoIcons.heart_fill,color: Colors.red, size: 14,),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}

