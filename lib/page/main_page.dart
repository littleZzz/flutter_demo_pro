import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/base/my_base_widget.dart';
import 'package:flutter_demo_pro/base/my_gesturedetector.dart';
import 'package:flutter_demo_pro/base/my_text_widget.dart';
import 'package:flutter_demo_pro/res/colors_res.dart';
import 'package:flutter_demo_pro/routes/application.dart';
import 'package:flutter_demo_pro/routes/routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///主界面 hah
class MainPage extends StatefulWidget {
  final Object arguments;

  MainPage(this.arguments);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MyBaseWidget(
      title: "主界面",
      content: Container(
        child: Column(
          children: [
            MyTextWidget(text: "Fluro参数：${widget.arguments}"),
            MyTextWidget(text: "ListView.builder"),
            Container(
              height: 250.h,
              child: ListView(
                padding: EdgeInsets.all(0.0),
                itemExtent: 100.h,
                physics: BouncingScrollPhysics(),
                children: [],
              ),
            ),
            MyTextWidget(text: "ListView.builder"),
            Container(
              height: 250.h,
              child: ListView.builder(
                padding: EdgeInsets.all(0.0),
                itemCount: 20,
                itemExtent: 100.h,
//                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    color: ColorRes.coloryellow00,
                    child: MyTextWidget(text: "item:$index"),
                  );
                },
              ),
            ),
            MyGestureDetector(
              child: Container(
                margin: EdgeInsets.fromLTRB(50.w, 50.h, 50.w, 0.0),
                padding: EdgeInsets.fromLTRB(0.0, 50.w, 0.0, 50.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.w),
                  color: ColorRes.colorOrange00,
                ),
                alignment: Alignment.center,
                child: MyTextWidget(text: "Provider", color: ColorRes.white),
              ),
              onTap: () {
                Application.router.navigateTo(context, Routes.providerPage);
              },
            )
          ],
        ),
      ),
    );
  }
}
