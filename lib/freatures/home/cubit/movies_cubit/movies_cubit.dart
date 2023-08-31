import 'package:bloc/bloc.dart';
import 'package:golcoin_movies/core/utils/enums.dart';
import 'package:golcoin_movies/freatures/home/cubit/movies_cubit/movies_state.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';
import 'package:golcoin_movies/freatures/home/repositories/home_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MoviesCubit extends Cubit<MoviesState> {
  final HomeRepository _homeRepository;

  MoviesCubit(this._homeRepository) : super(const MoviesState.initial());

  Map<RequestType,PagingController<int, MovieDataItem?>?>? moviesController;

  int index = 1;

  clear(RequestType requestType) {
    index = 1;
    moviesController?[requestType]?.dispose();
  }

  void initController(RequestType requestType) {
    moviesController ??= {};
    moviesController?[requestType] = PagingController(firstPageKey: 1, invisibleItemsThreshold: 1);
    moviesController?[requestType]?.addPageRequestListener((index) {
      this.index = index;
      getMoviesPaginated(page: index,requestType: requestType);
    });
  }

  Future<void> getMoviesPaginated({
    required int? page,
    required RequestType? requestType,
  }) async {
    if (index == 1) {
      emit(const MoviesState.loading());
    }

    final result = await _homeRepository.getMoviesList(page, requestType);

    result.fold((l) {
      if (index == 1) {
        emit(MoviesState.error(l));
      }
      moviesController?[requestType]?.error = l;
    }, (result) {

      if (index == 1) {
        emit(MoviesState.loaded(result));
      }

      bool isLastPage = (result.totalPages ?? 0) == (result.page ?? 0);

      index = index + 1;
      if (isLastPage) {
        moviesController?[requestType]?.appendLastPage(result.results ?? []);
      } else {
        moviesController?[requestType]?.appendPage(result.results ?? [], index);
      }
    });
  }
}
