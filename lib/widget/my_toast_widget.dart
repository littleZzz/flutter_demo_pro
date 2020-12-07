import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/base/my_text_widget.dart';
import 'package:flutter_demo_pro/res/colors_res.dart';
import 'package:flutter_demo_pro/util/gaps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo_pro/extension/string_extension.dart';

//自己写的 toast 提示类
class MyToastWidget extends StatelessWidget {
  var flag; //0是叹号提示 其他是成功的提示
  String text;

  MyToastWidget({this.flag: 0, this.text: ''});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 450.w, maxWidth: 600.w, minHeight: 400.h),
      child: Container(
        decoration: new BoxDecoration(
          image: DecorationImage(image: AssetImage('images/juxing'.imgPath()), fit: BoxFit.fill),
        ),
        padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              flag == 0 ? 'images/t_tishi'.imgPath() : 'images/t_succeed'.imgPath(),
              width: 100.w,
              height: 100.h,
            ),
            Gaps.vGap50,
            MyTextWidget(
              textAlign: TextAlign.center,
              text: text,
              fontSize: 46.0,
              color: ColorRes.white,
            )
          ],
        ),
      ),
    );
  }
}
