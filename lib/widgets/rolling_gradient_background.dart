
import 'package:flutter/material.dart';

class RollingGradient extends StatefulWidget {
  final Widget child;

  const RollingGradient({
    Key key,
    this.child,
  }) : super(key: key);
  @override
  _RollingGradientState createState() => _RollingGradientState();
}

class _RollingGradientState extends State<RollingGradient> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      //lowerBound: 0,
      //upperBound: math.pi,
        duration: Duration(seconds: 5), vsync: this)
      ..addListener((){ setState(() {});});
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.lerp(Alignment.center, Alignment.topRight, _controller.value),
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB((_controller.value * 200 + 55).toInt(), 0xde, 0x62, 0x62),
                Color.fromARGB(255, 0xff, 0xb8, 0x8c)])),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
