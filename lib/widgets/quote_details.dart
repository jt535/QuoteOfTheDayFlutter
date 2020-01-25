
import 'package:flutter/material.dart';
import 'package:quote_of_the_day/api/models/quote_response.dart';

import 'giant_quoted_text.dart';

class QuoteDetails extends StatelessWidget {
  final QuoteResponse _quoteOfTheDay;

  const QuoteDetails({
    Key key,
    QuoteResponse quoteOfTheDay,
  }) : _quoteOfTheDay = quoteOfTheDay, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          _quoteOfTheDay.contents.quotes[0].title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: .9),),
        SizedBox(height: 12,),
        Container(
          color: Color.fromARGB(30, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 8.0, right: 16, bottom: 8),
            child: GiantQuotedText(text: _quoteOfTheDay.contents.quotes[0].quote),
          ),
        ),
        SizedBox(height: 16,),
        Align(
          alignment: Alignment.topRight,
          child: Text(_quoteOfTheDay.contents.quotes[0].author,
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),),
        )
      ],
    );
  }
}
