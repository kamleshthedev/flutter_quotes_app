import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/providers/authors_providers.dart';
import 'package:quotes_app/providers/quotes_providers.dart';
import 'package:quotes_app/providers/tags_providers.dart';
import 'package:quotes_app/theme/app_theme.dart';
import 'package:quotes_app/utils/app_routes.dart';
import 'screens/home_screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => QuotesProviders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TagsProviders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AuthorsProviders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Quotes App",
        initialRoute: HomeScreen.routeName,
        routes: appRoutes,
        theme: themeData(),
      ),
    );
  }
}
