import 'package:dartz/dartz.dart';
import 'package:golcoin_movies/core/exceptions/failure.dart';
import 'package:golcoin_movies/core/utils/enums.dart';
import 'package:golcoin_movies/freatures/home/models/categories_list_model.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, MoviesListModel>> getMoviesList(
    int? page,
    RequestType? requestType,
  );

  Future<Either<Failure, CategoriesListModel>> getCategories();
}
