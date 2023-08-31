import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:golcoin_movies/core/theme/dark_theme.dart';
import 'package:golcoin_movies/core/theme/light_theme.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:golcoin_movies/core/di/injection_container.dart' as di;

import 'package:sizer/sizer.dart';

import 'freatures/home/views/pages/main_page.dart';

init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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

    return Sizer(builder: (context, orientation, deviceType) {
      SizerUtil.height = Constants.kDesignSize.height;
      SizerUtil.width = Constants.kDesignSize.width;

      return MaterialApp(
        title: Constants.appName,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: ThemeMode.dark,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const MainPage(),
      );
    });
  }
}
