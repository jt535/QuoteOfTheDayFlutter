
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_of_the_day/pages/quote_of_the_day_page.dart';

import 'api/quotes_api.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(builder: (context) {
        return QuoteOfTheDayPageViewModel(api: QuoteAPI())..reload();
      } )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote of the Day App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuoteOfTheDayPage(),
    );
  }
}

