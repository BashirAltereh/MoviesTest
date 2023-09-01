import 'package:dartz/dartz.dart';
import 'package:golcoin_movies/core/exceptions/error_handler.dart';
import 'package:golcoin_movies/core/exceptions/failure.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';
import 'package:golcoin_movies/freatures/search/repositories/search_repository.dart';
import 'package:golcoin_movies/freatures/search/services/search_services.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final SearchServices _searchServices;

  SearchRepositoryImpl(
    this._searchServices,
  );

  @override
  Future<Either<Failure, MoviesListModel>> getMoviesList(int? page, String query) async {
    try {
      final response = await _searchServices.getMoviesList(page, query);

      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
