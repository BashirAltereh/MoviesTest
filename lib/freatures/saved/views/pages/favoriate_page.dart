import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golcoin_movies/core/di/injection_container.dart';
import 'package:golcoin_movies/core/views/widgets/loader_widget.dart';
import 'package:golcoin_movies/freatures/movie_details/views/pages/movie_details_page.dart';
import 'package:golcoin_movies/freatures/saved/cubit/favorites_cubit.dart';
import 'package:golcoin_movies/freatures/saved/cubit/favorites_state.dart';
import 'package:sizer/sizer.dart';

import '../widgets/favorite_movie_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late FavoritesCubit _favoritesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favoritesCubit = getIt<FavoritesCubit>();

    _getData();
  }

  void _getData() {
    _favoritesCubit.getFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
        bloc: _favoritesCubit,
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const LoaderWidget(),
              loaded: (result) {
                if (result?.isEmpty ?? true) {
                  return Center(
                    child: Text('no_favorite_movies'.tr(),
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w500)),
                  );
                }
                return ListView.builder(
                    itemCount: result?.length ?? 0,
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    itemBuilder: (context, index) {
                      return FavoriteMovieCard(
                        index: index,
                        movieDataItem: result?[index],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetails(
                                        index: index,
                                        movieDataItem: result?[index],
                                      )));
                        },
                        onRemovePressed: () {
                          _favoritesCubit.removeMovieFromFavorite(result?[index].id ?? 0);
                        },
                      );
                    });
              },
              orElse: () => const SizedBox.shrink());
        });
  }
}
