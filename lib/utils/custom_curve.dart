import 'dart:math';

import 'package:flutter/animation.dart';

class CustomSpringCurve extends Curve {
  const CustomSpringCurve({
    this.a = 1,
    this.w = 17,
  });
  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    if (t == 1.0) {
      return 1;
    }
    if (t == 0.0) {
      return 0;
    }
    var returnValue = -(pow(e, -t / a) * cos(t * w)) + 1;
    if (returnValue > 1.0) {
      returnValue = 2 - returnValue;
    }
    return returnValue;
  }
}
