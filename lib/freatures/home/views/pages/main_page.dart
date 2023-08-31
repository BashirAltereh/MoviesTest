import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/main_scaffold.dart';
import 'package:golcoin_movies/freatures/home/views/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: const HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
        items: navItems,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        currentIndex: 0,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
