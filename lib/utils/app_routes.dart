import 'package:flutter/material.dart';
import 'package:quotes_app/screens/home_screen/home_screen.dart';
import 'package:quotes_app/screens/quote_screen/quote_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  HomeScreen.routeName: (ctx) => HomeScreen(),
  QuoteScreen.routeName: (ctx) => QuoteScreen(),
};
