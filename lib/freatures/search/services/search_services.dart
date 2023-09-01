import 'package:dio/dio.dart' hide Headers;
import 'package:dio/dio.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:golcoin_movies/freatures/home/models/categories_list_model.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'search_services.g.dart';

@RestApi()
@LazySingleton()
abstract class SearchServices {
  @factoryMethod
  factory SearchServices(Dio dio) = _SearchServices;

  @GET("search/movie")
  Future<MoviesListModel> getMoviesList(@Query('page') int? page, @Query('query') String? query,
      {@Query('api_key') String? apiKey = Constants.apiKey});
}
