import 'package:flutter/material.dart';

class Constants {
  static const String appName = 'Golcoin Movies';

  static const String apiKey = '529bf848d14b9fc7da265edcae678a08';
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String imageUrl = 'https://image.tmdb.org/t/p/w300_and_h450_bestv2';

  static const kDesignSize = Size(375, 812);

  static const hiEmoji = '👋🏻';
  static const heroTag = 'movie_image_';


  static const Duration connectTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);
  static const Duration sendTimeout = Duration(seconds: 60);
  static const Duration prodConnectTimeout = Duration(seconds: 20);
  static const Duration prodReceiveTimeout = Duration(seconds: 20);
  static const Duration prodSendTimeout = Duration(seconds: 20);
}
