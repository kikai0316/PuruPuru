//
import 'package:flutter/cupertino.dart';

Widget nCustomScrollView({
  Future<void> Function()? onRefresh,
  required List<Widget> slivers,
}) {
  return CupertinoTheme(
    data: const CupertinoThemeData(brightness: Brightness.light),
    child: CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        ...slivers,
      ],
    ),
  );
}
