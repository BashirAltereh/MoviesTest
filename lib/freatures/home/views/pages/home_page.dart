import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/main_scaffold.dart';
import 'package:golcoin_movies/freatures/home/views/widgets/movies/movies_list.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/enums.dart';
import '../widgets/categories/categories_list.dart';
import '../widgets/welcome_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 6.h,
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
    );
  }
}
