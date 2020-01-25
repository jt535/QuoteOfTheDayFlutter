
import 'package:flutter/widgets.dart';

class GiantQuotedText extends StatelessWidget {
  final String text;
  const GiantQuotedText({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text("\"",
              style: TextStyle(fontSize: 40),),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14),),
            ),),
          Align(
            alignment: Alignment.bottomRight,
            child: Transform(
              transform: Matrix4.translationValues(0, 20, 0),
              child: Text("\"",
                style: TextStyle(fontSize: 40, textBaseline: TextBaseline.alphabetic),),
            ),
          ),
        ],
      ),
    );
  }
}
