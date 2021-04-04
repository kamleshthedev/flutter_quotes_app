import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/providers/quotes_providers.dart';
import 'package:quotes_app/theme/app_colors.dart';

class QuoteScreen extends StatefulWidget {
  static String routeName = '/quote';

  @override
  _QuoteScreen createState() => _QuoteScreen();
}

class _QuoteScreen extends State<QuoteScreen> {
  int index = 0;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      var args =
          ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
      if (args['isTag']) {
        Provider.of<QuotesProviders>(context).fetchByTag(args['title']);
      } else {
        Provider.of<QuotesProviders>(context).fetchByAuthor(args['authorId']);
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  final appBar = AppBar(
    leading: Icon(
      Icons.format_quote_rounded,
      size: 32,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final appBarHeight = appBar.preferredSize.height;
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    List<Quote> quotes =
        Provider.of<QuotesProviders>(context, listen: false).getQuotes;
    quotes.shuffle();
    log('$index');
    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Icon(
          Icons.chevron_right_rounded,
          color: kLightColor,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: quotes.length == 0
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(kLightColor),
                  strokeWidth: 3,
                  backgroundColor: kLightColor.withOpacity(0.25),
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: (screenHeight - appBarHeight - statusBarHeight) * 1,
                    child: PageView.builder(
                      itemCount: quotes.length,
                      controller: PageController(viewportFraction: 1),
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return _buildCarouselItem(
                          context,
                          itemIndex,
                          quotes,
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int itemIndex, List<Quote> quotes) {
    return Container(
      color: kDarkColor,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${quotes[itemIndex].content}',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: kLightColor,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '~ ${quotes[itemIndex].author}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF99A2AD),
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
