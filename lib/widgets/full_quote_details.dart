
import 'package:flutter/material.dart';
import 'package:quote_of_the_day/api/models/quote_response.dart';
import 'package:quote_of_the_day/widgets/quote_details.dart';

class FullQuoteDetails extends StatelessWidget {
  final QuoteResponse quoteResponse;

  const FullQuoteDetails({
    Key key,
    this.quoteResponse
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: QuoteDetails(quoteOfTheDay: quoteResponse),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Quote retrieved from taken from http://quotes.rest. Quote is © ${quoteResponse.contents.copyright}.",
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),),
        ),
      ],
    );
  }
}
