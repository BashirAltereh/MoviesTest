import 'package:dartz/dartz.dart';
import 'package:golcoin_movies/core/exceptions/failure.dart';
import 'package:golcoin_movies/freatures/movie_details/models/movie_cast_model.dart';

abstract class CastRepository {
  Future<Either<Failure, MovieCastModel>> getCredit(
    int? movieId
  );
}
