import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:golcoin_movies/core/views/widgets/image_view.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';
import 'package:sizer/sizer.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.index,required this.movieDataItem, this.onPressed, this.isSearch = false});

  final VoidCallback? onPressed;
  final bool isSearch;
  final int index;
  final MovieDataItem? movieDataItem;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 4.w),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Hero(
          tag: '${Constants.heroTag}${movieDataItem?.id}-$index',
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    SizedBox(
                      height: isSearch ? 26.h : 22.h,
                      width: isSearch ? 42.w : 35.w,
                      child: ImageView(
                          imageUrl: '${Constants.imageUrl}${movieDataItem?.posterPath ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.favorite_sharp,
                        color: Theme.of(context).colorScheme.error,
                        size: isSearch ? 35 : null,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 14.h,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 1.h, start: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(movieDataItem?.title ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 11.sp, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis),
                      Text('${movieDataItem?.voteAverage ?? ''} . Action',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Theme.of(context).colorScheme.secondary, fontSize: 11.sp),
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
