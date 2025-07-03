import 'package:flutter/material.dart';

//使いやすいようにまとめました。normal-Container=nContainer
Widget nContainer({
  double? squareSize,
  double? height,
  double? width,
  Color? color,
  double radius = 0,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  Gradient? gradient,
  AlignmentGeometry? alignment,
  BoxBorder? border,
  Widget? child,
  List<BoxShadow>? boxShadow,
  BorderRadiusGeometry? customBorderRadius,
  DecorationImage? image,
}) {
  return Container(
    margin: margin,
    padding: padding,
    alignment: alignment,
    height: squareSize ?? height,
    width: squareSize ?? width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: customBorderRadius ?? BorderRadius.circular(radius),
      border: border,
      gradient: gradient,
      image: image,
      boxShadow: boxShadow,
    ),
    child: child,
  );
}

//nContainerを改良して円を作りたいとき用のにまとめました。
Widget nContainerWithCircle({
  required double squareSize,
  Color? color,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  Gradient? gradient,
  AlignmentGeometry? alignment,
  BoxBorder? border,
  Widget? child,
  List<BoxShadow>? boxShadow,
  DecorationImage? image,
}) {
  return Container(
    margin: margin,
    padding: padding,
    alignment: alignment,
    height: squareSize,
    width: squareSize,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: border,
      gradient: gradient,
      image: image,
      boxShadow: boxShadow,
    ),
    child: child,
  );
}

//使いやすいようにまとめました。normal-Text=nText
Widget nText(
  BuildContext context,
  String text, {
  required double fontSize,
  Color color = Colors.black,
  double bold = 900,
  double height = 1,
  int? maxLiune,
  TextAlign textAlign = TextAlign.center,
  List<Shadow>? shadows,
  bool isOverflow = true, //親の大きさにを超えると、...で省略される。
  bool isFit = false, //親の大きさによって大きさを変わるようになる。
  TextDecoration decoration = TextDecoration.none,
  TextOverflow? customOverflow,
  String? fontFamily,
  double? letterSpacing,
}) {
  final textWidget = Text(
    text,
    textAlign: textAlign,
    overflow: customOverflow ?? (isOverflow ? TextOverflow.ellipsis : null),
    maxLines: maxLiune,
    style: TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
      decorationColor: color,
      fontFamily: fontFamily ?? "Jp",
      fontVariations: [FontVariation("wght", bold)],
      color: color,
      shadows: shadows,
      fontSize: fontSize,
    ),
  );
  if (isFit) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: textWidget,
    );
  }
  return textWidget;
}
