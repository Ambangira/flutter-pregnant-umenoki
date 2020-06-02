

import 'package:flutter/material.dart';

// app bar shape
class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    
    Path path = Path();
    path.lineTo(0, rect.height - 10);
    path.quadraticBezierTo(
    rect.width / 2, rect.height + 15, rect.width, rect.height - 10);
    path.lineTo(rect.width, 0);

    path.close();
    return path;
  }
}