import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/main_scaffold.dart';
import 'package:golcoin_movies/freatures/home/views/widgets/movies/movie_item.dart';
import 'package:sizer/sizer.dart';

import '../widgets/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        body: Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        const SearchWidget(),
        Expanded(
          child: GridView.builder(
              itemCount: 20,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 2.w),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  mainAxisExtent: 275,
              ),
              itemBuilder: (context, index) {
                return MovieItem(
                  isSearch: true,
                  onPressed: () {},
                );
              }),
        )
      ],
    ));
  }
}
