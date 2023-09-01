import 'package:bloc/bloc.dart';
import 'package:golcoin_movies/freatures/home/cubit/categories_cubit/categories_state.dart';
import 'package:golcoin_movies/freatures/home/cubit/movies_cubit/movies_state.dart';
import 'package:golcoin_movies/freatures/home/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepository _homeRepository;

  CategoriesCubit(this._homeRepository) : super(const CategoriesState.initial());

  getCategories() async {
    emit(const CategoriesState.loading());
    (await _homeRepository.getCategories())
        .fold((l) => emit(CategoriesState.error(l)), (r) => emit(CategoriesState.loaded(r)));
  }
}
