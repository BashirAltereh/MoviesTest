import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:golcoin_movies/core/exceptions/failure.dart';
import 'package:golcoin_movies/freatures/movie_details/models/movie_cast_model.dart';

part 'cast_state.freezed.dart';

@freezed
class CastState with _$CastState {
  const factory CastState.initial() = Initial;

  const factory CastState.loading() = Loading;

  const factory CastState.loaded(MovieCastModel? items) = Loaded;

  const factory CastState.error(Failure error) = Error;
}
