import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/base/my_text_widget.dart';
import 'package:flutter_demo_pro/res/colors_res.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 间隔
class Gaps {
  /// 水平间隔
  static Widget hGap5 = SizedBox(width: 5.0.w);
  static Widget hGap8 = SizedBox(width: 8.0.w);
  static Widget hGap10 = SizedBox(width: 10.0.w);
  static Widget hGap15 = SizedBox(width: 15.0.w);
  static Widget hGap20 = SizedBox(width: 20.0.w);
  static Widget hGap30 = SizedBox(width: 30.0.w);
  static Widget hGap40 = SizedBox(width: 40.0.w);
  static Widget hGap50 = SizedBox(width: 50.0.w);
  static Widget hGap60 = SizedBox(width: 60.0.w);
  static Widget hGap80 = SizedBox(width: 80.0.w);
  static Widget hGap100 = SizedBox(width: 100.0.w);

  /// 垂直间隔
  static Widget vGap1 = SizedBox(height: 1.0.h);
  static Widget vGap5 = SizedBox(height: 5.0.h);
  static Widget vGap8 = SizedBox(height: 8.0.h);
  static Widget vGap10 = SizedBox(height: 10.0.h);
  static Widget vGap15 = SizedBox(height: 15.h);
  static Widget vGap20 = SizedBox(height: 20.h);
  static Widget vGap30 = SizedBox(height: 30.h);
  static Widget vGap40 = SizedBox(height: 40.h);
  static Widget vGap45 = SizedBox(height: 45.0.h);
  static Widget vGap50 = SizedBox(height: 50.0.h);
  static Widget vGap60 = SizedBox(height: 60.h);
  static Widget vGap80 = SizedBox(height: 80.h);
  static Widget vGap100 = SizedBox(height: 100.0.h);

  static Widget line = const SizedBox(
    height: 1.0,
    width: double.infinity,
    child: const DecoratedBox(decoration: BoxDecoration(color: ColorRes.colorGrayf6)),
  );

  static Widget vLine = Container(
    alignment: Alignment.center,
    width: 2.0.w,
    color: ColorRes.colorGrayf2,
    child: MyTextWidget(text: ""),
  );

  static Widget vLineGet(double height) {
    return Container(
        alignment: Alignment.center,
        width: 2.0.w,
        height: height.h,
        color: ColorRes.colorGrayf2,
        child: MyTextWidget(text: ""));
  }

  static const Widget empty = const SizedBox();
}
