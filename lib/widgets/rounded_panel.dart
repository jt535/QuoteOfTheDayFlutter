
import 'package:flutter/widgets.dart';

class RoundedPanel extends StatelessWidget {
  final Widget child;

  const RoundedPanel({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Color.fromARGB(50, 255, 255, 255),
      ),
      child: child,
    );
  }
}
