import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/base/my_base_widget.dart';
import 'package:flutter_demo_pro/base/my_text_widget.dart';
import 'package:flutter_demo_pro/res/colors_res.dart';

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
        color: ColorsRes.colorOrange00,
        child: MyTextWidget(text: "这个是主界面${widget.arguments}"),
      ),
    );
  }
}
