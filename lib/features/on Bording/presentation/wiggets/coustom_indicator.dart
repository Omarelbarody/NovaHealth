import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CoustomIndicator extends StatelessWidget {
  const CoustomIndicator({super.key, required this.dotIndex});
  final int? dotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: Color(0xff2D84FB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.blue),
          )),
      dotsCount: 3,
      position: dotIndex!,
    );
  }
}
