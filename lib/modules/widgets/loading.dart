import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, required this.color, required this.size})
      : super(key: key);
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.fourRotatingDots(color: color, size: size);
  }
}
