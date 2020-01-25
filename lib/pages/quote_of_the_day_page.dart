
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_of_the_day/api/models/quote_response.dart';
import 'package:quote_of_the_day/api/quotes_api.dart';
import 'package:quote_of_the_day/widgets/full_quote_details.dart';
import 'package:quote_of_the_day/widgets/gradient_background.dart';
import 'package:quote_of_the_day/widgets/loading_message.dart';
import 'package:quote_of_the_day/widgets/rounded_panel.dart';

class QuoteOfTheDayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: GradientBackground(child:
            Consumer<QuoteOfTheDayPageViewModel>(builder: (context, repository, child) {
              if (repository.error != null) {
                return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => Provider.of<QuoteOfTheDayPageViewModel>(context).reload(force: true),
                    child: Center(child: _ErrorMessage(error: repository.error,)));
              } else if (!repository.isLoading && repository.quoteResponse != null) {
                return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => Provider.of<QuoteOfTheDayPageViewModel>(context).reload(force: true),
                    onLongPress: () => Provider.of<QuoteOfTheDayPageViewModel>(context).forceError(),
                    child: FullQuoteDetails(quoteResponse: repository.quoteResponse,));
              } else {
                return Center(child: LoadingMessage());
              }
            }),
        )
    );
  }
}

class _ErrorMessage extends StatelessWidget {

  final DioError error;

  const _ErrorMessage({
    Key key,
    @required this.error
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: RoundedPanel(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.error, size: 30, color: Colors.black38),
              SizedBox(height: 10,),
              Text("Could not download the quote of the day. Tap to retry. ", style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              Text(error.toString(), style: TextStyle(fontSize: 10),),
            ],
          ),
        ),
      ),
    );
  }
}

class QuoteOfTheDayPageViewModel extends ChangeNotifier {

  final QuoteAPI api;

  QuoteResponse _quoteResponse;
  QuoteResponse get quoteResponse => _quoteResponse;

  DioError _error;
  DioError get error => _error;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  QuoteOfTheDayPageViewModel({this.api});

  void reload({bool force = false}) async {

    if(_isLoading) return;

    if(!force && _quoteResponse != null) {
      return;// show the old quote of the day
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    _quoteResponse = await api.getQuoteOfTheDay()
        .catchError((error){
      _error = error;
      _isLoading = false;
      notifyListeners();
    });

    _isLoading = false;
    notifyListeners();
  }

  forceError() {
    _error = DioError(error: "This is a test error");
    _isLoading = false;
    notifyListeners();
  }
}