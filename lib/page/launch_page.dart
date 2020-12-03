import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/base/my_base_widget.dart';
import 'package:flutter_demo_pro/base/my_gesturedetector.dart';
import 'package:flutter_demo_pro/base/my_text_widget.dart';
import 'package:flutter_demo_pro/routes/application.dart';
import 'package:flutter_demo_pro/routes/routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///启动页面
class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    //设置屏幕适配尺寸
    ScreenUtil.init(context, designSize: Size(1080, 1920), allowFontScaling: false);
    return MyBaseWidget(
      isShowTitleBar: false,
      content: MyGestureDetector(
        child: Center(
          child: MyTextWidget(text: "启动页"),
        ),
        onTap: () {
          Application.router.navigateTo(
            context,
            Routes.mainPage,
            transition: TransitionType.fadeIn,
            routeSettings: RouteSettings(arguments: ["参数一", "参数二"]),
          );
        },
      ),
    );
  }
}
