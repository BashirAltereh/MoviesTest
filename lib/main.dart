import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golcoin_movies/core/app_cubit/theme_cubit.dart';
import 'package:golcoin_movies/core/app_cubit/theme_state.dart';
import 'package:golcoin_movies/core/theme/dark_theme.dart';
import 'package:golcoin_movies/core/theme/light_theme.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:golcoin_movies/core/di/injection_container.dart' as di;
import 'package:golcoin_movies/core/utils/data_store.dart';

import 'package:sizer/sizer.dart';

import 'core/di/injection_container.dart';
import 'freatures/home/views/pages/main_page.dart';

init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dataStore.openBox();

  await di.configure();
}

Future<void> main() async {
  await init();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = getIt<ThemeCubit>();

    return Sizer(builder: (context, orientation, deviceType) {
      SizerUtil.height = Constants.kDesignSize.height;
      SizerUtil.width = Constants.kDesignSize.width;

      return BlocBuilder<ThemeCubit,ThemeState>(
          bloc: themeCubit,
          builder: (context, state) {
            return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Constants.appName,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: themeCubit.themeMode,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const MainPage(),
          );
        }
      );
    });
  }
}
