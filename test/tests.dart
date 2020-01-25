
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quote_of_the_day/api/models/quote_response.dart';
import 'package:quote_of_the_day/api/quotes_api.dart';

void main() {


  final sampleQuoteResponse =
  """{
     "success": {
         "total": 1
     },
     "contents": {
         "quotes": [
             {
                 "quote": "The growth and development of people is the highest calling of leadership.",
                 "length": "74",
                 "author": "Harvey S. Firestone",
                 "tags": [
                     "growth",
                     "leadership",
                     "management",
                     "people",
                     "tod"
                 ],
                 "category": "management",
                 "date": "2020-01-18",
                 "permalink": "https://theysaidso.com/quote/harvey-s-firestone-the-growth-and-development-of-people-is-the-highest-calling-o",
                 "title": "Management Quote of the day",
                 "background": "https://theysaidso.com/img/bgs/hang_on_building_top.jpg",
                 "id": "4BnVo0xMrjeS9B4xtAH6ZAeF"
             }
         ],
         "copyright": "2017-19 theysaidso.com"
     }
  }""";


  test('test parse quote json', () async {

    QuoteResponse.fromJson(json.decode(sampleQuoteResponse));

  });

  test('test parse date from json', () async {

    var response = QuoteResponse.fromJson(json.decode(sampleQuoteResponse));

    expect(new DateTime(2020, 1, 18), response.contents.quotes[0].date);
  });


  test('test QuoteAPI.millisecondsLeftToday', () async {

    expect(24 * 60 * 60 * 1000,   QuoteAPI.millisecondsLeftToday(now: new DateTime(2020, 2, 3)));
    expect(16 * 60 * 60 * 1000,   QuoteAPI.millisecondsLeftToday(now: new DateTime(2020, 2, 3, 8)));
    expect(15.5 * 60 * 60 * 1000, QuoteAPI.millisecondsLeftToday(now: new DateTime(2020, 2, 3, 8, 30)));

  });

  test('test download from API', () async {
    //await new QuoteAPI().getQuoteOfTheDay();
  });
}
