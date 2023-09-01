import 'package:golcoin_movies/freatures/home/models/movie_data_item.dart';

abstract class FavoritesRepository {
  Future<bool> addMovieToFavorite(MovieDataItem movieDataItem);
  Future<bool> removeMovieFromFavorite(num movieId);
  bool isFavoriteMovie(num movieId);
  List<MovieDataItem> getFavorite();
}
