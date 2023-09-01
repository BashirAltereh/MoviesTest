import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golcoin_movies/core/di/injection_container.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:golcoin_movies/core/views/widgets/shimmer_placeholder.dart';
import 'package:golcoin_movies/freatures/home/cubit/categories_cubit/categories_cubit.dart';
import 'package:golcoin_movies/freatures/home/cubit/categories_cubit/categories_state.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/views/widgets/title_widget.dart';
import 'category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  late CategoriesCubit _categoriesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoriesCubit = getIt<CategoriesCubit>();
    _getData();
  }

  void _getData() {
    _categoriesCubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
          title: 'category'.tr(),
          withSeeAll: true,
          onPressed: () {},
        ),
        SizedBox(
          height: 12.h,
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
              bloc: _categoriesCubit,
              builder: (context, state) {
                return state.maybeWhen(
                    loaded: (result) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          itemCount: result?.genres?.length ?? 0,
                          itemBuilder: (context, index) => CategoryItem(
                                title: result?.genres?[index].name ?? '',
                                emoji: Constants.categoryEmojis[result?.genres?[index].name ?? ''] ?? Constants.hiEmoji,
                                onPressed: () {},
                              ));
                    },
                    loading: () => CustomShimmer.categoriesListShimmer(),
                    orElse: () => const SizedBox.shrink());
              }),
        ),
      ],
    );
  }
}
