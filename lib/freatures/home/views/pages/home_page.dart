import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/di/injection_container.dart';
import 'package:golcoin_movies/core/views/widgets/main_scaffold.dart';
import 'package:golcoin_movies/core/views/widgets/switch_theme_widget.dart';
import 'package:golcoin_movies/freatures/home/views/widgets/movies/movies_list.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/enums.dart';
import '../../cubit/categories_cubit/categories_cubit.dart';
import '../../cubit/movies_cubit/movies_cubit.dart';
import '../widgets/categories/categories_list.dart';
import '../widgets/welcome_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MoviesCubit _moviesCubit;
  late CategoriesCubit _categoriesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moviesCubit = getIt<MoviesCubit>();
    _categoriesCubit = getIt<CategoriesCubit>();
  }

  void _refreshData(){
    _categoriesCubit.getCategories();
    try {
      _moviesCubit.moviesController?[RequestType.popular]?.refresh();
    }catch(e){
      debugPrint('onRefresh: error-> $e');
    }
    try {
      _moviesCubit.moviesController?[RequestType.upcoming]?.refresh();
    }catch(e){
      debugPrint('onRefresh: error-> $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: RefreshIndicator(
        onRefresh: () {
          _refreshData();
          return Future.delayed(const Duration(seconds: 1));
        },
        child: ListView(
          children: [
            SizedBox(
              height: 1.h,
            ),
            const SwitchThemeWidget(),
            SizedBox(
              height: 1.h,
            ),
            const WelcomeWidget(),
            SizedBox(
              height: 4.h,
            ),
            const CategoriesList(),
            SizedBox(
              height: 2.h,
            ),
            MoviesList(title: 'trending_movies'.tr(), requestType: RequestType.popular),
            SizedBox(
              height: 1.h,
            ),
            MoviesList(
              title: 'upcoming_movies'.tr(),
              requestType: RequestType.upcoming,
            )
          ],
        ),
      ),
    );
  }
}
