import 'package:dartz/dartz.dart';
import 'package:golcoin_movies/core/exceptions/error_handler.dart';
import 'package:golcoin_movies/core/exceptions/failure.dart';
import 'package:golcoin_movies/freatures/movie_details/models/movie_cast_model.dart';
import 'package:golcoin_movies/freatures/movie_details/repositories/cast_repository.dart';
import 'package:golcoin_movies/freatures/movie_details/services/cast_services.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CastRepository)
class CastRepositoryImpl implements CastRepository {
  final CastServices _searchServices;

  CastRepositoryImpl(
    this._searchServices,
  );

  @override
  Future<Either<Failure, MovieCastModel>> getCredit(int? movieId) async {
    try {
      final response = await _searchServices.getCredits(movieId);

      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
