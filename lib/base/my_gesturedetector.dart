import 'package:flutter/material.dart';

///自定义手势点击widget 默认是不穿透的  后续需要啥子字段直接加入就ok了
class MyGestureDetector extends StatelessWidget {
  final Widget child;
  final HitTestBehavior behavior;
  final GestureTapCallback onTap;
  DateTime lastPopTime;

  MyGestureDetector({this.child, this.behavior: HitTestBehavior.opaque, this.onTap});

  FocusNode blankNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () {
        FocusScope.of(context).requestFocus(blankNode); //点击空白获取焦点  ios实现空白输入框收起功能
        // 防重复提交
        if (lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(milliseconds: 600)) {
          lastPopTime = DateTime.now();
          if (onTap != null) onTap();
        }
        /*else {
          lastPopTime = DateTime.now();
        }*/
      },
      behavior: behavior,
    );
  }
}
