import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/base/my_base_widget.dart';
import 'package:flutter_demo_pro/base/my_gesturedetector.dart';
import 'package:flutter_demo_pro/base/my_text_widget.dart';
import 'package:flutter_demo_pro/entity/counter_entity.dart';
import 'package:flutter_demo_pro/res/colors_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///状态管理 provider 页面
class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    CounterEntity counterEntity = Provider.of<CounterEntity>(context);
    return MyBaseWidget(
      title: 'Provider',
      content: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    child: MyTextWidget(
                      text: "当前计数器的数值：${counterEntity.count}\n\r",
                    ),
                  );
                }),
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
              child: MyTextWidget(text: "点击增加计数器数值", color: ColorRes.white),
            ),
            onTap: () {
              counterEntity.increaseCount();
            },
          ),
        ],
      ),
    );
  }
}
