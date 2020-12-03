import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/page/launch_page.dart';
import 'package:flutter_demo_pro/page/main_page.dart';

class Routes {
  // 用于路由返回监听 didPop didPush等
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  static String root = "/"; //启动页

  static String mainPage = "/mainPage"; //主页面

  static void configureRoutes(FluroRouter router) {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Scaffold(appBar: AppBar(title: Text('页面不存在')), body: Center(child: Text('你要找的页面不存在')));
    });

    router.define(root, handler: Handler(handlerFunc: (context, params) {
      return LaunchPage();
    }));
    router.define(mainPage, handler: Handler(handlerFunc: (context, params) {
      return MainPage(context.settings.arguments);
    }));
  }

//一个共有的Provider
//  static MultiProvider multiProvider(Widget page) {
//    return MultiProvider(
//      providers: [
//        ChangeNotifierProvider(create: (_) => HomeBloc()),
//        ChangeNotifierProvider(create: (_) => CartBloc()),
//        ChangeNotifierProvider(create: (_) => OrderBloc()),
//        ChangeNotifierProvider(create: (_) => PersionBloc()),
//      ],
//      child: page,
//    );
//  }
}
