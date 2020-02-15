
import 'package:flutter/material.dart';
import 'package:quote_of_the_day/api/models/quote_response.dart';
import 'package:quote_of_the_day/widgets/rounded_panel.dart';

import 'giant_quoted_text.dart';

class QuoteDetails extends StatefulWidget {
  final QuoteResponse _quoteOfTheDay;

  const QuoteDetails({
    Key key,
    QuoteResponse quoteOfTheDay,
  })
      : _quoteOfTheDay = quoteOfTheDay,
        super(key: key);

  @override
  _QuoteDetailsState createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _offsetAnimation;
  Animation _alphaAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    _animationController.addListener((){setState(() {});});
    _offsetAnimation = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.1, 1.0)
    ));
    _alphaAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.1, 1.0)
    ));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: Curves.easeIn.transform(_alphaAnimation.value),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Transform.translate(
            offset: Offset(Curves.easeInBack.transform(_offsetAnimation.value) * -200,0),
            child: Text(
              widget._quoteOfTheDay.contents.quotes[0].title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: .9),),
          ),
          SizedBox(height: 12,),
          Transform.translate(
            offset: Offset(Curves.easeInBack.transform(_offsetAnimation.value) * 200,0),
            child: RoundedPanel(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 8.0, right: 16, bottom: 8),
                child: GiantQuotedText(text: widget._quoteOfTheDay.contents.quotes[0].quote),
              ),
            ),
          ),
          SizedBox(height: 16,),
          Transform.translate(
            offset: Offset(0, Curves.easeInBack.transform(_offsetAnimation.value) * -50),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(widget._quoteOfTheDay.contents.quotes[0].author,
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
