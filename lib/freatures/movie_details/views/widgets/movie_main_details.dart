import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:golcoin_movies/core/views/widgets/image_view.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';
import 'package:golcoin_movies/freatures/movie_details/views/widgets/info_widget.dart';
import 'package:sizer/sizer.dart';

class MovieMainDetails extends StatelessWidget {
  const MovieMainDetails({super.key,required this.index, required this.movieDataItem});

  final int index;
  final MovieDataItem? movieDataItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Hero(
            tag: '${Constants.heroTag}${movieDataItem?.id}-$index',
            child: Card(
              margin: EdgeInsets.zero,
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  ImageView(imageUrl: '${Constants.imageUrl}${movieDataItem?.posterPath ?? ''}'),
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
        SizedBox(
          width: 8.w,
        ),
        Column(
          children: [
            const InfoWidget(
              title: 'Genre',
              subtitle: 'action drama',
              icon: CupertinoIcons.play_rectangle,
            ),
            const InfoWidget(
              title: 'Duration',
              subtitle: '131 mins',
              icon: CupertinoIcons.time,
            ),
            InfoWidget(
              title: 'Rating',
              subtitle: '${movieDataItem?.voteAverage ?? 0}',
              icon: CupertinoIcons.star,
            ),
          ],
        ),
        SizedBox(
          width: 6.w,
        ),
      ],
    );
  }
}
