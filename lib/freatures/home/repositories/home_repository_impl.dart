import 'package:dartz/dartz.dart';
import 'package:golcoin_movies/core/exceptions/error_handler.dart';
import 'package:golcoin_movies/core/exceptions/failure.dart';
import 'package:golcoin_movies/core/utils/enums.dart';
import 'package:golcoin_movies/freatures/home/models/categories_list_model.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';
import 'package:golcoin_movies/freatures/home/repositories/home_repository.dart';
import 'package:golcoin_movies/freatures/home/services/home_services.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: HomeRepository)
class UsersRepositoryImpl implements HomeRepository {
  final HomeServices _homeServices;

  UsersRepositoryImpl(this._homeServices,);

  @override
  Future<Either<Failure, CategoriesListModel>> getCategories() async {
    try {
      final response = await _homeServices.getCategories();

      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, MoviesListModel>> getMoviesList(int? page, RequestType? requestType) async {
    try {
      final response = await _homeServices.getMoviesList(page, requestType?.value);

      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }


}
