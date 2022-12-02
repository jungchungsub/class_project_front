import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

RatingBar ReviewRatingBar() {
  return RatingBar.builder(
    initialRating: 3,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {
      // save 동작 필요함
    },
  );
}
