import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:golcoin_movies/core/exceptions/failure.dart';
import 'package:golcoin_movies/freatures/home/models/movie_data_item.dart';

part 'favorites_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = Initial;

  const factory FavoritesState.loading() = Loading;

  const factory FavoritesState.loaded(List<MovieDataItem>? items) = Loaded;

  const factory FavoritesState.error(Failure error) = Error;
}
