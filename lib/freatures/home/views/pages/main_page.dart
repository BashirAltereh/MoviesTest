import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golcoin_movies/core/di/injection_container.dart';
import 'package:golcoin_movies/core/views/widgets/main_scaffold.dart';
import 'package:golcoin_movies/freatures/home/cubit/main_cubit/bottom_nav_state.dart';

import '../../cubit/main_cubit/botttom_nav_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late BottomNavCubit _bottomNavCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomNavCubit = getIt<BottomNavCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
        bloc: _bottomNavCubit,
        builder: (context, state) {
          return MainScaffold(
            body: _bottomNavCubit.pages[_bottomNavCubit.selectedPageIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
              items: _bottomNavCubit.navItems,
              elevation: 0,
              onTap: (index) {
                _bottomNavCubit.updatePageIndex(index);
              },
              type: BottomNavigationBarType.shifting,
              currentIndex: _bottomNavCubit.selectedPageIndex,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.secondary,
            ),
          );
        });
  }
}
