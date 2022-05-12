import 'package:flutter/cupertino.dart';

class ProfileClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCenter(center: size.center(Offset.zero), width: 265, height: 265);
  }
  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}


class PreviewProfileClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCenter(center: size.center(Offset.zero), width: 400, height: 400);
  }
  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}
