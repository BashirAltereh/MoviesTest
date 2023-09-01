import 'package:bloc/bloc.dart';
import 'package:golcoin_movies/core/utils/enums.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';
import 'package:golcoin_movies/freatures/search/cubit/search_state.dart';
import 'package:golcoin_movies/freatures/search/repositories/search_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _searchRepository;

  SearchCubit(this._searchRepository) : super(const SearchState.initial());

  PagingController<int, MovieDataItem?>? moviesController;

  int index = 1;
  String query = '';

  clear() {
    index = 1;
    query = '';
    moviesController?.dispose();
  }

  void initController() {
    moviesController = PagingController(firstPageKey: 1, invisibleItemsThreshold: 1);
    moviesController?.addPageRequestListener((index) {
      this.index = index;
      getMoviesPaginated(page: index, query: query.isEmpty ? 'a' : query);
    });
  }

  Future<void> getMoviesPaginated({
    required int? page,
    required String query,
  }) async {
    if (index == 1) {
      emit(const SearchState.loading());
    }

    final result = await _searchRepository.getMoviesList(page, query);

    result.fold((l) {
      if (index == 1) {
        emit(SearchState.error(l));
      }
      moviesController?.error = l;
    }, (result) {
      if (index == 1) {
        emit(SearchState.loaded(result));
      }

      bool isLastPage = (result.totalPages ?? 0) == (result.page ?? 0);

      index = index + 1;
      if (isLastPage) {
        moviesController?.appendLastPage(result.results ?? []);
      } else {
        moviesController?.appendPage(result.results ?? [], index);
      }
    });
  }
}
