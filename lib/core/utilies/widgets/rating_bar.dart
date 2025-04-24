import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rating extends StatelessWidget {
   Rating({super.key,required this.rating});

  final double rating ;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15.sp,
                    unratedColor: Colors.white,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {},
                    ratingWidget: RatingWidget(
                      full: const Icon(Icons.star, color: Colors.amber),
                      half: const Icon(Icons.star_half, color: Colors.amber),
                      empty: const Icon(Icons.star_border, color: Colors.amber),
                    ),
                  );
  }
}