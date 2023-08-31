import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golcoin_movies/freatures/home/views/pages/home_page.dart';
import 'package:golcoin_movies/freatures/saved/views/pages/tabs_page.dart';
import 'package:golcoin_movies/freatures/search/views/pages/search_page.dart';
import 'package:injectable/injectable.dart';

import 'bottom_nav_state.dart';

@lazySingleton
class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavState.initial());

  int selectedPageIndex = 0;

  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    SavedTabsPage(),
  ];

  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.home),
      label: 'home'.tr(),
      tooltip: 'home'.tr(),
    ),
    BottomNavigationBarItem(icon: const Icon(Icons.category_outlined), label: 'explore'.tr(), tooltip: 'explore'.tr()),
    BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.square_stack_3d_down_right), label: 'saved'.tr(), tooltip: 'saved'.tr()),
  ];

  updatePageIndex(int index) {
    emit(const BottomNavState.initial());
    selectedPageIndex = index;
    emit(BottomNavState.bottomNavLoaded(index));
  }
}
