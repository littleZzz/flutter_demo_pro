import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/base/my_gesturedetector.dart';
import 'package:flutter_demo_pro/base/my_text_widget.dart';
import 'package:flutter_demo_pro/res/colors_res.dart';
import 'package:flutter_demo_pro/util/image_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppbar extends StatelessWidget {
  String rightImg; //右边的图片按钮
  bool isShowBack;
  String title;
  String rightText; //右边的文本 有内容就是要显示右边的
  Function leftCallback; //左边按钮的点击事件自定义
  Function rigthTextCallback;
  Function rigthImgCallback;

  MyAppbar({
    this.rightImg: "",
    this.isShowBack: true,
    this.title: "",
    this.rightText: '',
    this.leftCallback,
    this.rigthTextCallback,
    this.rigthImgCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110.h,
      alignment: Alignment.centerLeft,
      color: ColorsRes.white,
      padding: EdgeInsets.fromLTRB(30.w, 0.0, 30.w, 0.0),
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Offstage(
                offstage: !isShowBack,
                child: GestureDetector(
                  child: Container(
                    width: 200.w,
                    height: 110.h,
                    color: ColorsRes.white,
                    alignment: Alignment.centerLeft,
                    child: Image.asset(ImageUtils.getImgPath('images/back'), width: 100.w, height: 100.w),
                  ),
                  onTap: () => leftCallback == null
                      ? (Navigator.canPop(context) ? Navigator.pop(context) : "")
                      : leftCallback(),
                ),
              ),
              Expanded(child: MyTextWidget(text: "")),
              Visibility(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(ImageUtils.getImgPath(rightImg), width: 100.w),
                  ),
                  onTap: () {
                    if (rigthImgCallback != null) rigthImgCallback();
                  },
                ),
                visible: rightImg.isNotEmpty,
              ),
              Visibility(
                visible: rightText.isNotEmpty,
                child: MyGestureDetector(
                  child: MyTextWidget(text: rightText, fontSize: 46.0, color: ColorsRes.colorGray66),
                  onTap: () {
                    if (rigthTextCallback != null) rigthTextCallback();
                  },
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(fontSize: 52.w, color: ColorsRes.colorGray33),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
