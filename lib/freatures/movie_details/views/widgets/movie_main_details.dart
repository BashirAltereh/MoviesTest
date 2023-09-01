import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golcoin_movies/core/di/injection_container.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:golcoin_movies/core/views/widgets/image_view.dart';
import 'package:golcoin_movies/freatures/home/models/movie_data_item.dart';
import 'package:golcoin_movies/freatures/movie_details/views/widgets/info_widget.dart';
import 'package:golcoin_movies/freatures/saved/cubit/favorites_cubit.dart';
import 'package:golcoin_movies/freatures/saved/cubit/favorites_state.dart';
import 'package:sizer/sizer.dart';

class MovieMainDetails extends StatefulWidget {
  const MovieMainDetails({super.key, required this.index, required this.movieDataItem});

  final int index;
  final MovieDataItem? movieDataItem;

  @override
  State<MovieMainDetails> createState() => _MovieMainDetailsState();
}

class _MovieMainDetailsState extends State<MovieMainDetails> {
  late FavoritesCubit _favoritesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favoritesCubit = getIt<FavoritesCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Hero(
            tag: '${Constants.heroTag}${widget.movieDataItem?.id}-${widget.index}',
            child: Card(
              margin: EdgeInsets.zero,
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  ImageView(imageUrl: '${Constants.imageUrl}${widget.movieDataItem?.posterPath ?? ''}'),
                  BlocBuilder<FavoritesCubit, FavoritesState>(
                      bloc: _favoritesCubit,
                      builder: (context, state) {
                        bool isFavorite = _favoritesCubit.isFavoriteMovie(widget.movieDataItem?.id ?? 0);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                          child: CupertinoButton(
                            onPressed: () {
                              if (isFavorite) {
                                _favoritesCubit.removeMovieFromFavorite(widget.movieDataItem?.id ?? 0);
                              } else {
                                if (widget.movieDataItem != null) {
                                  _favoritesCubit.addMovieToFavorite(widget.movieDataItem!);
                                }
                              }
                            },
                            padding: EdgeInsets.zero,
                            child: Icon(
                              isFavorite ? Icons.favorite_sharp : Icons.favorite_outline_sharp,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .error,
                              size: 35,
                            ),
                          ),
                        );
                      })
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
              index: 0,
            ),
            const InfoWidget(
              title: 'Duration',
              subtitle: '131 mins',
              icon: CupertinoIcons.time,
              index: 1,
            ),
            InfoWidget(
              title: 'Rating',
              subtitle: '${widget.movieDataItem?.voteAverage ?? 0}',
              icon: CupertinoIcons.star,
              index: 2,
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
