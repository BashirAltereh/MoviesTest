import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:golcoin_movies/freatures/home/models/movie_data_item.dart';
import 'package:hive/hive.dart';
import "package:path_provider/path_provider.dart" as path_provider;


enum DataStoreKeys { favorite }

class DataStore {
  late Box<dynamic> _box;

  Future<void> openBox() async {
    if (!kIsWeb) {
      final Directory appDocDir = await path_provider.getApplicationDocumentsDirectory();
      final String appDocPath = appDocDir.path;
      try {
        Hive.resetAdapters();
        Hive
          ..init(appDocPath)
          ..registerAdapter(
            MovieDataItemAdapter(),
          );
      } catch (e) {
        debugPrint('error: $e');
      }
    }

    _box = await Hive.openBox("appBox");
  }

  reOpenBox() async {
    await Hive.openBox("appBox");
  }

  Future<bool> saveItem(MovieDataItem favoriteItem) async {
    List<MovieDataItem> list = getFavoriteItems();
    list.add(favoriteItem);

    await _box.put(DataStoreKeys.favorite.name, list);
    return true;
  }

  Future<bool> deleteItem(num movieId) async {
    List<MovieDataItem> list = getFavoriteItems();
    try {
      list.removeWhere((element) => element.id == movieId,);
    } catch (e) {
      debugPrint('deleteItem error: $e');
    }
    await _box.put(DataStoreKeys.favorite.name, list);
    return true;
  }

  List<MovieDataItem> getFavoriteItems() {
    List<dynamic> list = _box.get(DataStoreKeys.favorite.name) ?? [];
    List<MovieDataItem> result = [];
    for (dynamic element in list) {
      try {
        result.add(element as MovieDataItem);
      } catch (e) {
        debugPrint('Error while getting item: $e');
      }
    }

    return result;
  }
}

final dataStore = DataStore();
