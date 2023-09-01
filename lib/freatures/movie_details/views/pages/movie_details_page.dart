import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/main_scaffold.dart';
import 'package:golcoin_movies/core/views/widgets/outline_button.dart';
import 'package:golcoin_movies/freatures/movie_details/views/widgets/movie_main_details.dart';
import 'package:golcoin_movies/freatures/movie_details/views/widgets/summary_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/views/widgets/animation_scale_widget.dart';
import '../../../home/models/movie_data_item.dart';
import '../widgets/cast_widget.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.index, required this.movieDataItem});

  final int index;
  final MovieDataItem? movieDataItem;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appbar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('movie_details'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primaryContainer, fontWeight: FontWeight.w500)),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 4.h,
            ),
            MovieMainDetails(index: widget.index,movieDataItem: widget.movieDataItem),
            _titleWidget(),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 1.h, bottom: 2.h, start: 7.w, end: 4.w),
              child: Row(
                children: [
                  AnimationScaleWidget(
                    horizontalOffset: -50,
                    verticalOffset: 0,
                    child: OutlineButton(
                        icon: CupertinoIcons.play_circle_fill,
                        onPressed: () {},
                        child: Text('watch_trailer'.tr(),
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.primaryContainer))),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    child: AnimationScaleWidget(
                      horizontalOffset: 50,
                      verticalOffset: 0,
                      child: OutlineButton(
                          icon: Icons.sticky_note_2_outlined,
                          onPressed: () {},
                          child: Text('add_to_my_watching_list'.tr(),
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.primaryContainer))),
                    ),
                  ),
                ],
              ),
            ),
            SummaryWidget(summary: widget.movieDataItem?.overview ?? ''),
            CastWidget(movieId: widget.movieDataItem?.id)
          ],
        ));
  }

  Widget _titleWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
      child: Text(widget.movieDataItem?.title ?? '',
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.primaryContainer),
          maxLines: 3,
          overflow: TextOverflow.ellipsis),
    );
  }
}
