import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:golcoin_movies/core/exceptions/failure.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';

part 'movies_state.freezed.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState.initial() = Initial;

  const factory MoviesState.loading() = Loading;

  const factory MoviesState.loaded(MoviesListModel? items) = Loaded;

  const factory MoviesState.error(Failure error) = Error;
}
