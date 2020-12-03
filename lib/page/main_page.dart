import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/base/my_base_widget.dart';
import 'package:flutter_demo_pro/base/my_text_widget.dart';
import 'package:flutter_demo_pro/res/colors_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///主界面
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
            )
          ],
        ),
      ),
    );
  }
}
