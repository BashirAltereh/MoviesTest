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
import 'package:golcoin_movies/core/di/app_module.dart' as _i15;
import 'package:golcoin_movies/freatures/home/cubit/categories_cubit/categories_cubit.dart'
    as _i13;
import 'package:golcoin_movies/freatures/home/cubit/main_cubit/botttom_nav_cubit.dart'
    as _i3;
import 'package:golcoin_movies/freatures/home/cubit/movies_cubit/movies_cubit.dart'
    as _i10;
import 'package:golcoin_movies/freatures/home/repositories/home_repository.dart'
    as _i8;
import 'package:golcoin_movies/freatures/home/repositories/home_repository_impl.dart'
    as _i9;
import 'package:golcoin_movies/freatures/home/services/home_services.dart'
    as _i5;
import 'package:golcoin_movies/freatures/search/cubit/search_cubit.dart'
    as _i14;
import 'package:golcoin_movies/freatures/search/repositories/search_repository.dart'
    as _i11;
import 'package:golcoin_movies/freatures/search/repositories/search_repository_impl.dart'
    as _i12;
import 'package:golcoin_movies/freatures/search/services/search_services.dart'
    as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

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
    gh.lazySingleton<_i5.HomeServices>(() => _i5.HomeServices(gh<_i4.Dio>()));
    gh.lazySingleton<_i6.SearchServices>(
        () => _i6.SearchServices(gh<_i4.Dio>()));
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i8.HomeRepository>(
        _i9.UsersRepositoryImpl(gh<_i5.HomeServices>()));
    gh.lazySingleton<_i10.MoviesCubit>(
        () => _i10.MoviesCubit(gh<_i8.HomeRepository>()));
    gh.singleton<_i11.SearchRepository>(
        _i12.SearchRepositoryImpl(gh<_i6.SearchServices>()));
    gh.lazySingleton<_i13.CategoriesCubit>(
        () => _i13.CategoriesCubit(gh<_i8.HomeRepository>()));
    gh.lazySingleton<_i14.SearchCubit>(
        () => _i14.SearchCubit(gh<_i11.SearchRepository>()));
    return this;
  }
}

class _$AppModule extends _i15.AppModule {}
