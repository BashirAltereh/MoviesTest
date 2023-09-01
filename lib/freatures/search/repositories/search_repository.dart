import 'package:dartz/dartz.dart';
import 'package:golcoin_movies/core/exceptions/failure.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, MoviesListModel>> getMoviesList(
    int? page,
    String query,
  );
}
