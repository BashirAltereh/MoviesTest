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
import 'package:golcoin_movies/core/di/app_module.dart' as _i11;
import 'package:golcoin_movies/freatures/home/cubit/categories_cubit/categories_cubit.dart'
    as _i10;
import 'package:golcoin_movies/freatures/home/cubit/main_cubit/botttom_nav_cubit.dart'
    as _i3;
import 'package:golcoin_movies/freatures/home/cubit/movies_cubit/movies_cubit.dart'
    as _i9;
import 'package:golcoin_movies/freatures/home/repositories/home_repository.dart'
    as _i7;
import 'package:golcoin_movies/freatures/home/repositories/home_repository_impl.dart'
    as _i8;
import 'package:golcoin_movies/freatures/home/services/home_services.dart'
    as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

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
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i7.HomeRepository>(
        _i8.UsersRepositoryImpl(gh<_i5.HomeServices>()));
    gh.lazySingleton<_i9.MoviesCubit>(
        () => _i9.MoviesCubit(gh<_i7.HomeRepository>()));
    gh.lazySingleton<_i10.CategoriesCubit>(
        () => _i10.CategoriesCubit(gh<_i7.HomeRepository>()));
    return this;
  }
}

class _$AppModule extends _i11.AppModule {}
