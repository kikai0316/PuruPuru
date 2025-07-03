// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// PreferredSizeWidget? nTabBar(
//   BuildContext context, {
//   List<String>? tabTitleTexts,
//   List<IconData>? tabTitleIcons,
// }) {
//   final safeAreaWidth = MediaQuery.of(context).size.width;
//   // TextStyle textStyle(double size) => TextStyle(
//   //       decoration: TextDecoration.none,
//   //       fontFamily: "Normal",
//   //       fontVariations: const [FontVariation("wght", 700)],
//   //       height: 1,
//   //       color: Colors.white,
//   //       fontSize: size,
//   //     );
//   return TabBar(
//     dividerColor: Colors.transparent,
//     overlayColor: MaterialStateProperty.all(Colors.transparent),
//     labelColor: Colors.black,
//     indicatorPadding: EdgeInsets.only(bottom: safeAreaWidth * 0.01),
//     unselectedLabelColor: Colors.black.withOpacity(0.3),
//     indicatorColor: Colors.black,
//     indicator: UnderlineTabIndicator(
//       borderSide: const BorderSide(width: 3),
//       borderRadius: BorderRadius.circular(100),
//       insets: EdgeInsets.symmetric(
//         horizontal: safeAreaWidth * 0.15,
//       ),
//     ),
//     // labelStyle: textStyle(
//     //   safeAreaWidth / 24,
//     // ),
//     // unselectedLabelStyle: textStyle(
//     //   safeAreaWidth / 10,
//     // ),
//     tabs: [
//       if (tabTitleTexts != null)
//         ...List.generate(
//           tabTitleTexts.length,
//           (index) => Tab(text: tabTitleTexts[index]),
//         ),
//       if (tabTitleIcons != null)
//         ...List.generate(
//           tabTitleIcons.length,
//           (index) => Tab(
//             icon: Icon(size: safeAreaWidth * 0.07, tabTitleIcons[index]),
//           ),
//         ),
//     ],
//   );
// }

// PreferredSizeWidget? nTabBarForOriginal(
//   BuildContext context, {
//   required List<String> tabTitles,
//   required ValueNotifier<int> selectIndex,
// }) {
//   final safeAreaWidth = MediaQuery.of(context).size.width;
//   final safeAreaHeight = safeHeight(context);
//   Color textColor(int index) =>
//       Colors.black.withOpacity(selectIndex.value == index ? 1 : 0.2);

//   return PreferredSize(
//     preferredSize: Size.zero,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(
//         tabTitles.length,
//         (index) => GestureDetector(
//           onTap: selectIndex.value != index
//               ? () async {
//                   selectIndex.value = index;
//                   await HapticFeedback.mediumImpact();
//                 }
//               : null,
//           child: nContainer(
//             margin: nSpacing(xSize: safeAreaWidth * 0.01),
//             padding: nSpacing(
//               ySize: safeAreaHeight * 0.03,
//               xSize: safeAreaWidth * 0.015,
//             ),
//             color: Colors.transparent,
//             child: nText(
//               context,
//               tabTitles[index],
//               color: textColor(index),
//               fontSize: safeAreaWidth / 24,
//               bold: 700,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
