import 'package:flutter/material.dart';
import 'package:quote_of_the_day/widgets/rounded_panel.dart';

class LoadingMessage extends StatelessWidget {
  const LoadingMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedPanel(child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white38),),
          SizedBox(
            height: 12,
          ),
          Text("loading...")
        ],
      ),
    ));
  }
}
