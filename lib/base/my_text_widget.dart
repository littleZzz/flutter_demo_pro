import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/res/colors_res.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

///自己的一个文本控件  方便减少代码的
class MyTextWidget extends StatelessWidget {
  String text;
  double fontSize;
  Color color; //默认是文本橙色
  FontWeight fontWeight;
  TextAlign textAlign;
  int maxlines;
  TextOverflow overflow;
  double height; //这个height 特殊
  double left; //padding 值
  double top;
  double right;
  double bottom;
  TextBaseline textBaseline;
  TextDecoration decoration;

  MyTextWidget({
    this.text: "",
    this.fontSize: 40.0,
    this.color: ColorRes.colorText,
    this.fontWeight: FontWeight.normal,
    this.textAlign: TextAlign.start,
    this.maxlines: 100,
    this.overflow: TextOverflow.ellipsis,
    this.height: 1.0,
    this.left: 0.0,
    this.top: 0.0,
    this.right: 0.0,
    this.bottom: 0.0,
    this.textBaseline,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left.w, top.h, right.w, bottom.h),
      child: Text(
        text,
        maxLines: maxlines,
        overflow: overflow,
        style: TextStyle(
          fontSize: fontSize.sp,
          color: color,
          fontWeight: fontWeight,
          height: height == 1.0 ? null : height,
          textBaseline: textBaseline,
          decoration: decoration,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
