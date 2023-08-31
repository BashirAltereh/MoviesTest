import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/views/widgets/title_widget.dart';
import 'category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

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
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              itemCount: 10,
              itemBuilder: (context, index) => CategoryItem(
                    title: 'title: $index',
                    emoji: Constants.hiEmoji,
                    onPressed: () {},
                  )),
        ),
      ],
    );
  }
}
