import 'package:flutter/material.dart';
import 'package:sup_frontend/constant/color_constant.dart';

//使いやすいようにまとめました。normal-Spacing=nSpacing
//Padding,Marginの両方の大きさを変えるときに使用する。
EdgeInsetsGeometry nSpacing({
  double? allSize,
  double? xSize,
  double? ySize,
  double left = 0,
  double right = 0,
  double top = 0,
  double bottom = 0,
}) {
  return EdgeInsets.only(
    left: allSize ?? xSize ?? left,
    right: allSize ?? xSize ?? right,
    top: allSize ?? ySize ?? top,
    bottom: allSize ?? ySize ?? bottom,
  );
}

BoxBorder nBorder({
  Color color = subBackgroundColor,
  double width = 1,
  bool isOnlyTop = false,
  bool isOnlyBottom = false,
  bool isOnlyRight = false,
  bool isOnlyLeft = false,
}) {
  if (!isOnlyTop && !isOnlyBottom && !isOnlyRight && !isOnlyLeft) {
    return Border.all(
      strokeAlign: BorderSide.strokeAlignOutside,
      color: color,
      width: width,
    );
  } else {
    final BorderSide borderSide = BorderSide(color: color, width: width);
    return Border(
      top: isOnlyTop ? BorderSide(color: color, width: width) : BorderSide.none,
      bottom: isOnlyBottom ? borderSide : BorderSide.none,
      right: isOnlyRight ? borderSide : BorderSide.none,
      left: isOnlyLeft ? borderSide : BorderSide.none,
    );
  }
}

List<BoxShadow> nBoxShadow({
  double shadow = 0.5,
  Color? color,
}) {
  return [
    BoxShadow(
      color: color ?? Colors.black.withAlpha((shadow * 255).toInt()),
      blurRadius: 20,
      spreadRadius: 1.0,
    ),
  ];
}

Gradient nGradation({
  AlignmentGeometry begin = Alignment.topCenter,
  AlignmentGeometry end = Alignment.bottomCenter,
  required List<Color> colors,
}) {
  return LinearGradient(
    begin: begin,
    end: end,
    colors: colors,
  );
}
