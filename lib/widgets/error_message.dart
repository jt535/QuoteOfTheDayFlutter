
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quote_of_the_day/widgets/rounded_panel.dart';

class ErrorMessage extends StatelessWidget {

  final DioError error;

  const ErrorMessage({
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