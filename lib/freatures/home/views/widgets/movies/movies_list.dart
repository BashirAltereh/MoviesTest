import 'package:flutter/material.dart';
import 'package:golcoin_movies/freatures/home/views/widgets/movies/movie_item.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/views/widgets/title_widget.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
          title: title,
        ),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 30.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              itemCount: 10,
              itemBuilder: (context, index) => MovieItem(onPressed: (){

              },)),
        ),
      ],
    );
  }
}
