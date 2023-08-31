import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/favorite_movie_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(vertical: 6.h),
        itemBuilder: (context, index) {
          return const FavoriteMovieCard();
        });
  }
}
