import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/models/quote.dart';

class QuotesProviders with ChangeNotifier {
  List<Quote> _quotes = [];

  var dio = Dio();
  var baseUrl = 'https://api.quotable.io';

  get getQuotes {
    return [..._quotes];
  }

  emptyQuotes() {
    _quotes = [];
  }

  fetchByTag(String tag) async {
    log('Fetching Tags Quotes.....');
    try {
      var response = await dio.get('$baseUrl/quotes?tags=$tag');
      List<Quote> resData = (response.data['results'] as List)
          .map((json) => Quote.fromJson(json))
          .toList();
      _quotes = resData;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  fetchByAuthor(String authorId) async {
    log('Fetching Authors Quotes.....');
    try {
      var response = await dio.get('$baseUrl/quotes?authorId=$authorId');
      List<Quote> resData = (response.data['results'] as List)
          .map((json) => Quote.fromJson(json))
          .toList();
      _quotes = resData;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
