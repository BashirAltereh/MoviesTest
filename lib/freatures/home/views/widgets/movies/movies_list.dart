import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/di/injection_container.dart';
import 'package:golcoin_movies/core/utils/enums.dart';
import 'package:golcoin_movies/core/views/widgets/loader_widget.dart';
import 'package:golcoin_movies/core/views/widgets/shimmer_placeholder.dart';
import 'package:golcoin_movies/freatures/home/cubit/movies_cubit/movies_cubit.dart';
import 'package:golcoin_movies/freatures/home/views/widgets/movies/movie_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/views/widgets/title_widget.dart';
import '../../../../movie_details/views/pages/movie_details_page.dart';
import '../../../models/movies_list_model.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key, required this.title, required this.requestType});

  final String title;
  final RequestType requestType;

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late MoviesCubit _moviesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moviesCubit = getIt<MoviesCubit>();
    _getData();
  }

  void _getData() {
    _moviesCubit.initController(widget.requestType);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
          title: widget.title,
        ),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 30.h,
          child: PagedListView<int, MovieDataItem?>(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            pagingController: _moviesCubit.moviesController![widget.requestType]!,
            builderDelegate: PagedChildBuilderDelegate<MovieDataItem?>(
              animateTransitions: false,
              firstPageProgressIndicatorBuilder: (_) => CustomShimmer.listShimmer(),
              newPageProgressIndicatorBuilder: (_) => const LoaderWidget(),
              firstPageErrorIndicatorBuilder: (_) =>
                  Center(child: Text(_moviesCubit.moviesController?[widget.requestType]?.error.toString() ?? '')),
              itemBuilder: (context, item, index) {
                return MovieItem(
                  index: index,
                  movieDataItem: item,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetails(
                              index: index,
                              movieDataItem: item,
                                )));
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _moviesCubit.clear(widget.requestType);
  }
}
