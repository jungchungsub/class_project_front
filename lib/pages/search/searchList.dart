// main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchListPage extends StatefulWidget {
  const SearchListPage({Key? key}) : super(key: key);

  @override
  _SearchListPageState createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"image": "https://picsum.photos/201", "name": "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.", "age": 50000},
    {"image": "https://picsum.photos/202", "name": "앱 만들어드립니다", "age": 10000},
    {"image": "https://picsum.photos/203", "name": "반응형 홈페이지 아무것이나 만들어드립니다", "age": 200000},
    {"image": "https://picsum.photos/204", "name": "flutter를 사용하여 간단한 앱 만들어드립니다", "age": 500000},
    {"image": "https://picsum.photos/201", "name": "앱 만들어드립니다", "age": 50000},
    {"image": "https://picsum.photos/202", "name": "앱 만들어드립니다", "age": 10000},
    {"image": "https://picsum.photos/203", "name": "반응형 홈페이지 아무것이나 만들어드립니다", "age": 200000},
    {"image": "https://picsum.photos/204", "name": "flutter를 사용하여 간단한 앱 만들어드립니다", "age": 5000000},
    {"image": "https://picsum.photos/203", "name": "반응형 홈페이지 아무것이나 만들어드립니다", "age": 200000},
    {"image": "https://picsum.photos/204", "name": "flutter를 사용하여 간단한 앱 만들어드립니다", "age": 5000000}
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers.where((user) => user["name"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
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
        "검색",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(labelText: '검색어를 입력해주세요', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                          key: ValueKey(_foundUsers[index]["image"]),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16, right: 10, bottom: 8, left: 10),
                            child: InkWell(
                              onTap: () {
                                // Navigator.pushNamed(context, "/lessonDetail", arguments: itemIndex);
                              },
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8, left: 8, top: 4),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          height: 90,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(image: NetworkImage("${_foundUsers[index]['image']}"), fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 180,
                                              height: 50,
                                              child: Text(
                                                _foundUsers[index]['name'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons.star_fill,
                                                  color: Colors.yellow,
                                                  size: 16,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "|   45개의 평가",
                                                  style: TextStyle(fontSize: 14),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 220,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    '${_foundUsers[index]["age"].toString()} 원',
                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                  ),
                                                  Icon(
                                                    CupertinoIcons.heart_fill,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    )
                  : const Text(
                      '검색결과가 없습니다',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
