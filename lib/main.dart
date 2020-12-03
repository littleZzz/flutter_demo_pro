import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/page/launch_page.dart';
import 'package:flutter_demo_pro/routes/application.dart';
import 'package:flutter_demo_pro/routes/routers.dart';

///应用入口
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    FluroRouter router = FluroRouter(); //初始化路由
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LaunchPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
