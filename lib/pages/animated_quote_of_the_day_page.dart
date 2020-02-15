
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_of_the_day/pages/quote_of_the_day_page_view_model.dart';
import 'package:quote_of_the_day/widgets/full_quote_details.dart';
import 'package:quote_of_the_day/widgets/loading_message.dart';
import 'package:quote_of_the_day/widgets/rolling_gradient_background.dart';
import 'package:quote_of_the_day/widgets/rounded_panel.dart';



class AnimatedQuoteOfTheDayPage extends StatefulWidget {
  @override
  _AnimatedQuoteOfTheDayPageState createState() => _AnimatedQuoteOfTheDayPageState();
}

enum _AnimatedQuoteOfTheDayPageStateEnum { loading, showing, error }

class _AnimatedQuoteOfTheDayPageState extends State<AnimatedQuoteOfTheDayPage> {

  _AnimatedQuoteOfTheDayPageStateEnum enumState;

  @override
  void didChangeDependencies() {

    Provider.of<QuoteOfTheDayPageViewModel>(context).addListener(this.onViewModelChange);

    this.onViewModelChange();
    super.didChangeDependencies();
  }

  void onViewModelChange(){

    var viewModel = Provider.of<QuoteOfTheDayPageViewModel>(context);
    setState(() {
      if (viewModel.error != null) {
        enumState = _AnimatedQuoteOfTheDayPageStateEnum.error;
      } else if (!viewModel.isLoading && viewModel.quoteResponse != null) {
        enumState = _AnimatedQuoteOfTheDayPageStateEnum.showing;
      } else {
        enumState = _AnimatedQuoteOfTheDayPageStateEnum.loading;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<QuoteOfTheDayPageViewModel>(context);

    return Material(
      child: RollingGradient(child:
        Stack(
          children: <Widget>[
              AnimatedOpacity(
                  opacity: isLoading() ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Center(child: LoadingMessage())),
            if(isShowing()) GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Provider.of<QuoteOfTheDayPageViewModel>(context).reload(force: true, fakeDelay: true),
                onLongPress: () => Provider.of<QuoteOfTheDayPageViewModel>(context).forceError(),
                child: FullQuoteDetails(quoteResponse: viewModel.quoteResponse,)),
            AnimatedOpacity(
              opacity: hasError() ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Provider.of<QuoteOfTheDayPageViewModel>(context).reload(force: true, fakeDelay: true),
                  child: !hasError() ? Container() : Center(child: _ErrorMessage(error: viewModel.lastError,))),
            )
          ],
        )
      ),
    );
  }

  bool isShowing() => enumState == _AnimatedQuoteOfTheDayPageStateEnum.showing;
  bool hasError()  => enumState == _AnimatedQuoteOfTheDayPageStateEnum.error;
  bool isLoading() => enumState == _AnimatedQuoteOfTheDayPageStateEnum.loading;
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