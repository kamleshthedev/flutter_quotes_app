import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/providers/authors_providers.dart';
import 'package:quotes_app/providers/tags_providers.dart';
import 'package:quotes_app/screens/home_screen/authors_page.dart';
import 'package:quotes_app/screens/home_screen/tags_page.dart';

import 'package:quotes_app/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<TagsProviders>(context).fetchTags();
      Provider.of<AuthorsProviders>(context).fetchAuthors();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quote\'s App'.toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: kLightColor.withOpacity(0.5),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xFF31333F),
            ),
            labelStyle: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(
                child: buildTabBar('Tags'),
              ),
              Tab(
                child: buildTabBar('Authors'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TagsPage(),
            AuthorsPage(),
          ],
        ),
      ),
    );
  }

  Container buildTabBar(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Color(0xFF31333F),
          width: 1,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text('$title'.toUpperCase()),
      ),
    );
  }
}
