import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/res/colors_res.dart';

import 'my_appbar.dart';

///统一的页面空间兰
class MyBaseWidget extends StatefulWidget {
  String title;
  Widget content;
  bool isShowTitleBar;
  bool isShowBack;
  String rightText; //右边的文本 有内容就是要显示右边的
  String rightImg; //右边的图片img 的地址
  Function leftCallback; //左边按钮的点击事件自定义
  Function rigthTextCallback;
  Function rigthImgCallback;
  Widget bottomNavigationBar;

  MyBaseWidget(
      {this.isShowTitleBar: true,
      this.isShowBack: true,
      this.title: "",
      @required this.content,
      this.rightText: "",
      this.leftCallback,
      this.rigthTextCallback,
      this.rightImg: "",
      this.rigthImgCallback,
      this.bottomNavigationBar});

  @override
  _MyBaseWidgetState createState() => _MyBaseWidgetState();
}

class _MyBaseWidgetState extends State<MyBaseWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*为了统一解决 软健盘弹出问题*/
      resizeToAvoidBottomInset: false,
      body: Container(
        color: ColorRes.colorGrayf6,
        margin: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).padding.top, 0.0, 0.0),
        child: Column(
          children: <Widget>[
            Offstage(
              offstage: !widget.isShowTitleBar,
              child: MyAppbar(
                title: widget.title,
                isShowBack: widget.isShowBack,
                leftCallback: widget.leftCallback,
                rightText: widget.rightText,
                rigthTextCallback: widget.rigthTextCallback,
                rightImg: widget.rightImg,
                rigthImgCallback: widget.rigthImgCallback,
              ),
            ), //标题栏
//            Gaps.line,
            Expanded(child: widget.content),
          ],
        ),
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
