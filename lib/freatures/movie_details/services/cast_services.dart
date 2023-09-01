import 'package:dio/dio.dart' hide Headers;
import 'package:dio/dio.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:golcoin_movies/freatures/movie_details/models/movie_cast_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'cast_services.g.dart';

@RestApi()
@LazySingleton()
abstract class CastServices {
  @factoryMethod
  factory CastServices(Dio dio) = _CastServices;

  @GET("movie/{movie_id}/credits")
  Future<MovieCastModel> getCredits(@Path('movie_id') int? movieId,
      {@Query('api_key') String? apiKey = Constants.apiKey});
}
