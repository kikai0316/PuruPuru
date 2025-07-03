import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purupuru/constant/color_constant.dart';
import 'package:purupuru/view/account_page.dart';
import 'package:purupuru/view/home_page.dart';
import 'package:purupuru/widget/initial_page_widget.dart';

class InitialPage extends HookConsumerWidget {
  const InitialPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = useState<int>(0);
    final pageList = [const HomePage(), const MyPage()];

    // useEffect(
    //   () {
    //     SchedulerBinding.instance.addPostFrameCallback((_) async {});
    //     return;
    //   },
    //   [],
    // );

    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          backgroundColor: mainBackgroundColor,
          body: IndexedStack(
            index: pageIndex.value,
            children: pageList,
          ),
          resizeToAvoidBottomInset: false,
          //↓ボトムバーの背景
          bottomNavigationBar: navigationBarWidget(
            context,
            children: [
              // ↓ボトムバーのアイコンたち
              navigationItemWidget(
                context,
                pageIndex: pageIndex,
                iconImage: "home_icon.png",
                itemIndex: 0,
              ),
              postIconWidget(
                context,
              ),
              navigationItemWidget(
                context,
                pageIndex: pageIndex,
                iconImage: "account_icon.png",
                itemIndex: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
