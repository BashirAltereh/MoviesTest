import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/main_scaffold.dart';
import 'package:golcoin_movies/freatures/home/views/widgets/movies/movie_item.dart';
import 'package:sizer/sizer.dart';

import '../../../movie_details/views/pages/movie_details_page.dart';
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
        SizedBox(height: 1.h),
        Expanded(
          child: GridView.builder(
              itemCount: 20,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 2.w),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  mainAxisExtent: 275,
              ),
              itemBuilder: (context, index) {
                return MovieItem(
                  index: index,
movieDataItem: null,
                  isSearch: true,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetails(
                              index: index,
                              movieDataItem: null,
                            )));
                  },
                );
              }),
        )
      ],
    ));
  }
}
