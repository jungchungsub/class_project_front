import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/home1.jpg",
              fit: BoxFit.cover,
              height: 100,
              width:  400,
            ),
          ),
          SizedBox(height: 15),
          _buildRow(),
        ],
      ),
    );
  }

  Row _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            _buildDetailIcon(Icons.bike_scooter),
            Text("뷰티, 운동"),
          ],
        ),
        Column(
          children: [
            _buildDetailIcon(Icons.music_note),
            Text("댄스, 뮤직"),
          ],
        ),
        Column(
          children: [
            _buildDetailIcon(Icons.article_rounded),
            Text("미술, 묵학"),
          ],
        ),
        Column(
          children: [
            _buildDetailIcon(Icons.ac_unit_rounded),
            Text("공예, 기타"),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailIcon(IconData mIcon) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {

                },
                icon: Icon(mIcon),
              ),
            ),
          )
        ],
      ),
    );
  }
}
