// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:golcoin_movies/core/di/app_module.dart' as _i22;
import 'package:golcoin_movies/freatures/home/cubit/categories_cubit/categories_cubit.dart'
    as _i19;
import 'package:golcoin_movies/freatures/home/cubit/main_cubit/botttom_nav_cubit.dart'
    as _i3;
import 'package:golcoin_movies/freatures/home/cubit/movies_cubit/movies_cubit.dart'
    as _i14;
import 'package:golcoin_movies/freatures/home/repositories/home_repository.dart'
    as _i12;
import 'package:golcoin_movies/freatures/home/repositories/home_repository_impl.dart'
    as _i13;
import 'package:golcoin_movies/freatures/home/services/home_services.dart'
    as _i7;
import 'package:golcoin_movies/freatures/movie_details/cubit/cast_cubit.dart'
    as _i21;
import 'package:golcoin_movies/freatures/movie_details/repositories/cast_repository.dart'
    as _i17;
import 'package:golcoin_movies/freatures/movie_details/repositories/cast_repository_impl.dart'
    as _i18;
import 'package:golcoin_movies/freatures/movie_details/services/cast_services.dart'
    as _i10;
import 'package:golcoin_movies/freatures/saved/cubit/favorites_cubit.dart'
    as _i11;
import 'package:golcoin_movies/freatures/saved/repositories/favorites_repository.dart'
    as _i5;
import 'package:golcoin_movies/freatures/saved/repositories/favorites_repository_impl.dart'
    as _i6;
import 'package:golcoin_movies/freatures/search/cubit/search_cubit.dart'
    as _i20;
import 'package:golcoin_movies/freatures/search/repositories/search_repository.dart'
    as _i15;
import 'package:golcoin_movies/freatures/search/repositories/search_repository_impl.dart'
    as _i16;
import 'package:golcoin_movies/freatures/search/services/search_services.dart'
    as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.BottomNavCubit>(() => _i3.BottomNavCubit());
    gh.lazySingleton<_i4.Dio>(() => appModule.dio);
    gh.singleton<_i5.FavoritesRepository>(_i6.FavoritesRepositoryImpl());
    gh.lazySingleton<_i7.HomeServices>(() => _i7.HomeServices(gh<_i4.Dio>()));
    gh.lazySingleton<_i8.SearchServices>(
        () => _i8.SearchServices(gh<_i4.Dio>()));
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i10.CastServices>(() => _i10.CastServices(gh<_i4.Dio>()));
    gh.lazySingleton<_i11.FavoritesCubit>(
        () => _i11.FavoritesCubit(gh<_i5.FavoritesRepository>()));
    gh.singleton<_i12.HomeRepository>(
        _i13.UsersRepositoryImpl(gh<_i7.HomeServices>()));
    gh.lazySingleton<_i14.MoviesCubit>(
        () => _i14.MoviesCubit(gh<_i12.HomeRepository>()));
    gh.singleton<_i15.SearchRepository>(
        _i16.SearchRepositoryImpl(gh<_i8.SearchServices>()));
    gh.singleton<_i17.CastRepository>(
        _i18.CastRepositoryImpl(gh<_i10.CastServices>()));
    gh.lazySingleton<_i19.CategoriesCubit>(
        () => _i19.CategoriesCubit(gh<_i12.HomeRepository>()));
    gh.lazySingleton<_i20.SearchCubit>(
        () => _i20.SearchCubit(gh<_i15.SearchRepository>()));
    gh.lazySingleton<_i21.CastCubit>(
        () => _i21.CastCubit(gh<_i17.CastRepository>()));
    return this;
  }
}

class _$AppModule extends _i22.AppModule {}
