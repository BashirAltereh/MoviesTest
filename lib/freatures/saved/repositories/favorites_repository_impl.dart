import 'package:golcoin_movies/core/utils/data_store.dart';
import 'package:golcoin_movies/freatures/home/models/movie_data_item.dart';
import 'package:golcoin_movies/freatures/saved/repositories/favorites_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FavoritesRepository)
class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl();

  @override
  Future<bool> addMovieToFavorite(MovieDataItem movieDataItem) async {
    return dataStore.saveItem(movieDataItem);
  }

  @override
  List<MovieDataItem> getFavorite() {
    return dataStore.getFavoriteItems();
  }

  @override
  Future<bool> removeMovieFromFavorite(num movieId) {
    return dataStore.deleteItem(movieId);
  }

  @override
  bool isFavoriteMovie(num movieId) {
    for (MovieDataItem element in getFavorite()) {
      if (element.id == movieId) {
        return true;
      }
    }
    return false;
  }
}
