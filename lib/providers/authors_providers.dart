import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/models/author.dart';

class AuthorsProviders with ChangeNotifier {
  List<Author> _authors = [];

  var dio = Dio();
  var baseUrl = 'https://api.quotable.io';

  get getAuthors {
    return [..._authors];
  }

  fetchAuthors() async {
    log('Fetching Authers.....');
    try {
      var response = await dio.get('$baseUrl/authors?sortBy=quoteCount');
      List<Author> resData = (response.data['results'] as List)
          .map((json) => Author.fromJson(json))
          .toList();
      _authors = resData;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
