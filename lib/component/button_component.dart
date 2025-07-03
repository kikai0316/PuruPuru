import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purupuru/component/image_component.dart';
import 'package:purupuru/component/widget_component.dart';
import 'package:purupuru/constant/app_constant.dart';
import 'package:purupuru/constant/color_constant.dart';

//推したら一瞬薄くなるアニメーション付きボタン
class CustomAnimatedOpacityButton extends HookConsumerWidget {
  const CustomAnimatedOpacityButton({
    super.key,
    required this.onTap,
    required this.child,
    this.onLongPress,
    this.opacity,
    this.vibration,
  });
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double? opacity;
  final Future<void> Function()? vibration;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTapEvent = useState<bool>(false);
    return GestureDetector(
      onTap: onTap != null
          ? () async {
              isTapEvent.value = false;
              if (vibration != null) {
                await vibration!();
              }
              onTap?.call();
            }
          : null,
      onLongPress: onLongPress,
      onTapDown: onTap != null ? (_) => isTapEvent.value = true : null,
      onTapCancel: onTap != null ? () => isTapEvent.value = false : null,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: isTapEvent.value ? opacity ?? 0.6 : 1,
        child: child,
      ),
    );
  }
}

Widget nButton(
  BuildContext context, {
  required VoidCallback? onTap,
  String? text,
  Color? backGroundColor,
  Color textColor = Colors.white,
  double? height,
  double? width,
  double? fontSize,
  double radius = 50,
  Widget? customWidget,
  BoxBorder? border,
  EdgeInsetsGeometry? margin,
  bool isFit = false,
}) {
  final safeAreaHeight = safeHeight(context);
  final safeAreaWidth = MediaQuery.of(context).size.width;
  return CustomAnimatedOpacityButton(
    onTap: onTap,
    vibration: () => HapticFeedback.mediumImpact(),
    child: nContainer(
      margin: margin,
      alignment: Alignment.center,
      height: height ?? (isFit ? null : safeAreaHeight * 0.07),
      width: width ?? safeAreaWidth * 0.8,
      color: backGroundColor,
      gradient: backGroundColor == null ? mainGradation() : null,
      border: border,
      radius: radius,
      child: customWidget ??
          nText(
            context,
            text ?? "",
            color: textColor,
            fontSize: fontSize ?? safeAreaWidth / 30,
            fontFamily: "Jp",
          ),
    ),
  );
}

Widget nIconButton({
  required VoidCallback? onTap,
  Color backGroundColor = Colors.transparent,
  Color iconColor = Colors.black,
  IconData? iconData,
  String? iconImage,
  double? iconSize,
  double? backgroundSize,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  bool isVibration = true,
}) {
  return CustomAnimatedOpacityButton(
    onTap: onTap,
    vibration: () => HapticFeedback.heavyImpact(),
    child: nContainer(
      margin: margin,
      padding: padding,
      alignment: Alignment.center,
      color: backGroundColor,
      radius: 100,
      child: () {
        if (iconData != null) {
          return Icon(
            iconData,
            size: iconSize,
            color: iconColor,
          );
        }
        if (iconImage != null) {
          return nContainer(squareSize: iconSize, image: assetImg(iconImage));
        }
      }(),
    ),
  );
}
