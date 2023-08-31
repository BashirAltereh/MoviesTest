import 'package:flutter/material.dart';
import 'package:golcoin_movies/freatures/home/views/widgets/movies/movie_item.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/views/widgets/title_widget.dart';
import '../../../../movie_details/views/pages/movie_details_page.dart';

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
              itemBuilder: (context, index) => MovieItem(
                    index: index,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetails(
                                    movieId: index,
                                  )));
                    },
                  )),
        ),
      ],
    );
  }
}
