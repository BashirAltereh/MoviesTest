import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:golcoin_movies/freatures/home/models/movie_data_item.dart';
import 'package:golcoin_movies/freatures/saved/cubit/favorites_state.dart';
import 'package:golcoin_movies/freatures/saved/repositories/favorites_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository _favoritesRepository;

  FavoritesCubit(this._favoritesRepository) : super(const FavoritesState.initial());

  Future<bool> addMovieToFavorite(MovieDataItem movieDataItem) async {
    emit(const FavoritesState.initial());
    HapticFeedback.lightImpact();
    await _favoritesRepository.addMovieToFavorite(movieDataItem);
    emit(FavoritesState.loaded(getFavorite()));
    return true;
  }

  List<MovieDataItem> getFavorite() {
    emit(const FavoritesState.loading());
    final list = _favoritesRepository.getFavorite();
    emit(FavoritesState.loaded(_favoritesRepository.getFavorite()));
    return list;
  }

  Future<bool> removeMovieFromFavorite(num movieId) async {
    emit(const FavoritesState.initial());
    HapticFeedback.lightImpact();
    await _favoritesRepository.removeMovieFromFavorite(movieId);
    emit(FavoritesState.loaded(getFavorite()));
    return true;
  }

  bool isFavoriteMovie(num movieId) {
    return _favoritesRepository.isFavoriteMovie(movieId);
  }
}
