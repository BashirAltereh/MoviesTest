import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:golcoin_movies/core/views/widgets/image_view.dart';
import 'package:golcoin_movies/freatures/movie_details/models/movie_cast_model.dart';
import 'package:sizer/sizer.dart';

class ActorItem extends StatelessWidget {
  const ActorItem({super.key, required this.cast});

  final Cast? cast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Column(
        children: [
          SizedBox(
            height: 64,
            width: 64,
            child: ImageView(radius: 100, imageUrl: '${Constants.imageUrl}${cast?.profilePath ?? ''}'),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            cast?.name ?? '',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
