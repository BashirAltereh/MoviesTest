import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/main_scaffold.dart';
import 'package:sizer/sizer.dart';

import 'favoriate_page.dart';

class SavedTabsPage extends StatefulWidget {
  const SavedTabsPage({super.key});

  @override
  State<SavedTabsPage> createState() => _SavedTabsPageState();
}

class _SavedTabsPageState extends State<SavedTabsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MainScaffold(
          body: Column(
        children: [
          TabBar(
            labelColor: Theme.of(context).colorScheme.primaryContainer,
            indicator: TabBarTheme.of(context).indicator,
            labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            splashBorderRadius: BorderRadius.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            unselectedLabelColor: Theme.of(context).colorScheme.primaryContainer,
            tabs: [
              Tab(height: 7.h,text: 'favorite_movies'.tr()),
              Tab(text: 'watching_list'.tr()),
            ],
          ),
           const Expanded(
             child: TabBarView(
              children: [
                FavoritePage(),
                FavoritePage(),
              ],
          ),
           ),
        ],
      )),
    );
  }
}
