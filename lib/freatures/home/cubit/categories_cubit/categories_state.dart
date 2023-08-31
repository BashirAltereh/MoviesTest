import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:golcoin_movies/core/exceptions/failure.dart';
import 'package:golcoin_movies/freatures/home/models/categories_list_model.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = Initial;

  const factory CategoriesState.loading() = Loading;

  const factory CategoriesState.loaded(CategoriesListModel? items) = Loaded;

  const factory CategoriesState.error(Failure error) = Error;
}
