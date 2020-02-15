
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quote_of_the_day/api/models/quote_response.dart';
import 'package:quote_of_the_day/api/quotes_api.dart';

class QuoteOfTheDayPageViewModel extends ChangeNotifier {

  final QuoteAPI api;

  QuoteResponse _quoteResponse;
  QuoteResponse get quoteResponse => _quoteResponse;

  DioError _error;
  DioError _lastError;
  DioError get error => _error;
  DioError get lastError => _lastError;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  QuoteOfTheDayPageViewModel({this.api});

  void reload({bool force = false, bool fakeDelay = false}) async {

    if(_isLoading) return;

    if(!force && _quoteResponse != null) {
      return;// show the old quote of the day
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    if(fakeDelay) await Future.delayed(Duration(seconds: 2));

    _quoteResponse = await api.getQuoteOfTheDay()
        .catchError((error){
      _lastError = _error = error;
      _isLoading = false;
      notifyListeners();
    });

    _isLoading = false;
    notifyListeners();
  }

  forceError() {
    _lastError = _error = DioError(error: "This is a test error");
    _isLoading = false;
    notifyListeners();
  }
}