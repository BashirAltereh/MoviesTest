import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/di/injection_container.dart';
import 'package:golcoin_movies/core/views/widgets/loader_widget.dart';
import 'package:golcoin_movies/core/views/widgets/main_scaffold.dart';
import 'package:golcoin_movies/freatures/home/models/movies_list_model.dart';
import 'package:golcoin_movies/freatures/home/views/widgets/movies/movie_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sizer/sizer.dart';

import '../../../movie_details/views/pages/movie_details_page.dart';
import '../../cubit/search_cubit.dart';
import '../widgets/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchCubit _searchCubit;

  Timer? _debounce;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchCubit = getIt<SearchCubit>();
    _getData();
  }

  void _getData() {
    _searchCubit.initController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _debounce?.cancel();
    _debounce = null;
    _searchCubit.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        body: Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        SearchWidget(onChanged: (value) {
          if (_debounce?.isActive ?? false) _debounce?.cancel();
          _debounce = Timer(const Duration(milliseconds: 500), () {
            _searchCubit.query = value ?? '';
            _searchCubit.moviesController?.refresh();
          });
        }),
        SizedBox(height: 1.h),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () {
              _searchCubit.moviesController?.refresh();
              return Future.delayed(const Duration(seconds: 1));
            },
            child: PagedGridView<int, MovieDataItem?>(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 2.w),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                mainAxisExtent: 275,
              ),
              pagingController: _searchCubit.moviesController!,
              builderDelegate: PagedChildBuilderDelegate<MovieDataItem?>(
                animateTransitions: false,
                firstPageProgressIndicatorBuilder: (_) => const Center(child: LoaderWidget()),
                newPageProgressIndicatorBuilder: (_) => const Center(
                  child: LoaderWidget(),
                ),
                noMoreItemsIndicatorBuilder: (_) => const SizedBox.shrink(),
                noItemsFoundIndicatorBuilder: (_) => Center(
                    child: Text('no_movies'.tr(),
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w500))),
                itemBuilder: (context, item, index) {
                  return MovieItem(
                    index: index,
                    movieDataItem: item,
                    isSearch: true,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetails(
                                    index: index,
                                    movieDataItem: item,
                                  )));
                    },
                  );
                },
              ),
            ),
          ),
        )
      ],
    ));
  }
}
