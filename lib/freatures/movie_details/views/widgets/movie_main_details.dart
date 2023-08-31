import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:golcoin_movies/core/views/widgets/image_view.dart';
import 'package:golcoin_movies/freatures/movie_details/views/widgets/info_widget.dart';
import 'package:sizer/sizer.dart';

class MovieMainDetails extends StatelessWidget {
  const MovieMainDetails({super.key, required this.movieId});

  final num movieId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8.w,),
        Expanded(
          child: Hero(
            tag: '${Constants.heroTag}$movieId',
            child: Card(
              margin: EdgeInsets.zero,
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SizedBox(
                    height: 40.h,
                    // width: 55.w,
                    child: const ImageView(
                        imageUrl:
                            'https://media.istockphoto.com/id/952063296/photo/conference-room.jpg?s=2048x2048&w=is&k=20&c=Pkze4PuxUP6_GmEycXW0iDKGwYZEu8wlDKM_8fwMp5E='),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_sharp,
                      color: Theme.of(context).colorScheme.error,
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w,),
        const Column(
          children: [
            InfoWidget(
              title: 'Genre',
              subtitle: 'actiob drama',
              icon: CupertinoIcons.play_rectangle,
            ),
            InfoWidget(
              title: 'Duration',
              subtitle: '131 mins',
              icon: CupertinoIcons.time,
            ),
            InfoWidget(
              title: 'Rating',
              subtitle: '8.54',
              icon: CupertinoIcons.star,
            ),
          ],
        ),
        SizedBox(width: 6.w,),

      ],
    );
  }
}
