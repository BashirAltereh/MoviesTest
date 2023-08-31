import 'package:dio/dio.dart' hide Headers;
import 'package:dio/dio.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:golcoin_movies/freatures/home/models/categories_list_model.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'home_services.g.dart';

@RestApi()
@LazySingleton()
abstract class HomeServices {
  @factoryMethod
  factory HomeServices(Dio dio) = _HomeServices;

  // discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc
  @GET("movie/{request_type}")
  Future<MoviesListModel> getMoviesList(@Query('page') int? page, @Path('request_type') String? requestType,
      {@Query('api_key') String? apiKey = Constants.apiKey});

  @GET("genre/movie/list")
  Future<CategoriesListModel> getCategories({@Query('api_key') String? apiKey = Constants.apiKey});
}
