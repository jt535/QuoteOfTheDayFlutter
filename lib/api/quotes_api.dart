import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'models/quote_response.dart';

class QuoteAPI {

  final String url;

  QuoteAPI({this.url = "http://quotes.rest"});

  Future<QuoteResponse> getQuoteOfTheDay() async {

    var dio = new Dio();
    dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: "http://quotes.rest")).interceptor);

    Response response = await dio.get(
        url + "/qod.json",
        options: buildCacheOptions(Duration(milliseconds: millisecondsLeftToday())));

    print(response.data);
    print(response);

    return QuoteResponse.fromJson(response.data);
  }

  static int millisecondsLeftToday({DateTime now}) {
    now = now ?? DateTime.now();
    var tomorrow = new DateTime(now.year, now.month, now.day).add(Duration(days: 1));
    var time = tomorrow.millisecondsSinceEpoch - now.millisecondsSinceEpoch;
    return time;
  }
}