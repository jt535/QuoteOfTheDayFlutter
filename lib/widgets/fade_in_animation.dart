
import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {

  final Widget child;

  FadeInAnimation({this.child});

  @override
  _FadeInAnimationState createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)
      ..addListener((){ setState(() {}); });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      child: widget.child,
      opacity: _animationController.value,);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}