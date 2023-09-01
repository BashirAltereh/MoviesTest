import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:golcoin_movies/core/exceptions/failure.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = Initial;

  const factory SearchState.loading() = Loading;

  const factory SearchState.loaded(MoviesListModel? items) = Loaded;

  const factory SearchState.error(Failure error) = Error;
}
