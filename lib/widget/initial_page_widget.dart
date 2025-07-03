import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sup_frontend/component/app_component.dart';
import 'package:sup_frontend/component/button_component.dart';
import 'package:sup_frontend/component/image_component.dart';
import 'package:sup_frontend/component/widget_component.dart';
import 'package:sup_frontend/constant/app_constant.dart';
import 'package:sup_frontend/constant/color_constant.dart';

//ボトムナビゲーターのボックス
Widget navigationBarWidget(BuildContext context,
    {required List<Widget> children,}) {
  final safeAreaHeight = safeHeight(context);
  return nContainer(
    height: safeAreaHeight * 0.11,
    border: nBorder(
      isOnlyTop: true,
      color: Colors.black.withAlpha((0.05 * 255).toInt()),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}

//ボトムナビゲーターのアイテムのwidget
Widget navigationItemWidget(
  BuildContext context, {
  required ValueNotifier pageIndex,
  required int itemIndex,
  required String iconImage,
}) {
  final safeAreaHeight = safeHeight(context);
  return CustomAnimatedOpacityButton(
    onTap:
        pageIndex.value != itemIndex ? () => pageIndex.value = itemIndex : null,
    vibration: () => HapticFeedback.heavyImpact(),
    child: Opacity(
      opacity: pageIndex.value == itemIndex ? 1 : 0.2,
      child: nContainer(
        squareSize: safeAreaHeight * 0.08,
        image: assetImg(
          iconImage,
        ),
      ),
    ),
  );
}

//投稿用のボタンWidget
Widget postIconWidget(
  BuildContext context,
) {
  final safeAreaHeight = safeHeight(context);
  return GestureDetector(
    child: nContainer(
      alignment: Alignment.center,
      squareSize: safeAreaHeight * 0.08,
      child: nContainer(
        alignment: Alignment.center,
        squareSize: safeAreaHeight * 0.07,
        radius: 50,
        gradient: mainGradation(),
        child: nContainer(
          boxShadow: nBoxShadow(shadow: 0.1),
          squareSize: safeAreaHeight * 0.035,
          image: assetImg("plus_icon_2.png"),
        ),
      ),
    ),
  );
}
