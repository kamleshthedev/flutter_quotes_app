import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:quotes_app/models/tags.dart';

class TagsProviders with ChangeNotifier {
  List<Tags> _tags = [];

  var dio = Dio();
  var baseUrl = 'https://api.quotable.io';

  get getTags {
    return [..._tags.where((tag) => tag.quoteCount >= 5).toList()];
  }

  fetchTags() async {
    log('Fetching Tags.....');
    try {
      var response = await dio.get('$baseUrl/tags?sortBy=quoteCount');
      List<Tags> resData =
          (response.data as List).map((json) => Tags.fromJson(json)).toList();
      _tags = resData;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
