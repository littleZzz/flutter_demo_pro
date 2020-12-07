import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_pro/net/exception_handle.dart';
import 'package:flutter_demo_pro/net/intercept.dart';
import 'package:flutter_demo_pro/net/urls.dart';
import 'package:flutter_demo_pro/routes/application.dart';
import 'package:flutter_demo_pro/routes/routers.dart';
import 'package:flutter_demo_pro/widget/my_toast_widget.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sp_util/sp_util.dart';

///@by xiaozhi
class DioUtils {
  //单例初始化
  // 工厂模式
  factory DioUtils() => _getInstance();

  static DioUtils get instance => _getInstance();
  static DioUtils _instance;
  static bool isDialogShow = false; //dialog 是否显示中

  static DioUtils _getInstance() {
    if (_instance == null) {
      _instance = new DioUtils._internal();
    }
    return _instance;
  }

  static Dio _dio;

  Dio getDio() {
    return _dio;
  }

  DioUtils._internal() {
    // 初始化
    var options = BaseOptions(
      connectTimeout: 15000, //超时时间15秒
      receiveTimeout: 15000, //      responseType: ResponseType.plain,
      //      validateStatus: (status) {
      //        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
      //        return true;
      //      },
      baseUrl: Urls.BASE_URL,
      //      contentType: ContentType('application', 'x-www-form-urlencoded', charset: 'utf-8'),
    );
    _dio = Dio(options);

    /// Fiddler抓包代理配置 https://www.jianshu.com/p/d831b1f7c45b
//    if (UrlUtil.isDebug) {
//      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
//        client.findProxy = (uri) {
//          //proxy all request to localhost:8888
//          return "PROXY 192.168.0.197:8866";
//        };
//        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//      };
//    }

    /// 统一添加身份验证请求头
    _dio.interceptors.add(AuthInterceptor());

    /// 打印Log(生产模式去除)
    if (Urls.isDebug) {
      _dio.interceptors.add(LoggingInterceptor());
    }

    /// 适配数据(根据自己的数据结构，可自行选择添加)
    //    _dio.interceptors.add(AdapterInterceptor());
  }

  ///get请求
  void myGet(String path, BuildContext context,
      {data,
      Map<String, dynamic> queryParameters,
      Function(Response response) successListener,
      Function errorListener,
      withLoading: false,
      String newBaseUrl: ""}) async {
//    if (withLoading) LoadingUtils().showLoadingDialog(); //显示loadingDialog
    handleBaseUrl(newBaseUrl); //处理baseUrl改变的问题
    await _dio.get(path, queryParameters: queryParameters).then(
          //统一的处理请求成功的方法
          (response) => handNetRequest(response, context, successListener, errorListener, newBaseUrl),
          onError: (e) => handNetError(e, errorListener: errorListener), //统一的处理请求失败的方法
        );
//    if (withLoading) LoadingUtils().dimissLoadingDialog(); //影藏loadingDialog
  }

  ///post请求
  void myPost(String path, BuildContext context,
      {data,
      Map<String, dynamic> queryParameters,
      Function(Response response) successListener,
      Function errorListener,
      withLoading: false,
      String newBaseUrl: ""}) async {
//    if (withLoading) LoadingUtils().showLoadingDialog(); //显示loadingDialog
    handleBaseUrl(newBaseUrl); //处理baseUrl改变的问题
    await _dio.post(path, data: json.encode(queryParameters)).then(
          (response) => handNetRequest(response, context, successListener, errorListener, newBaseUrl),
          //统一的处理请求成功的方法
          onError: (e) => handNetError(e, errorListener: errorListener), //统一的处理请求失败的方法
        );
//    if (withLoading) LoadingUtils().dimissLoadingDialog(); //影藏loadingDialog
  }

  ///put请求
  void myPut(String path, BuildContext context,
      {data,
      Map<String, dynamic> queryParameters,
      Function(Response response) successListener,
      Function errorListener,
      String newBaseUrl: ""}) async {
    handleBaseUrl(newBaseUrl); //处理baseUrl改变的问题
    await _dio.put(path, data: json.encode(queryParameters)).then(
          (response) => handNetRequest(response, context, successListener, errorListener, newBaseUrl),
          //统一的处理请求成功的方法
          onError: (e) => handNetError(e, errorListener: errorListener), //统一的处理请求失败的方法
        );
  }

  ///put请求
  void myDelete(String path, BuildContext context,
      {data,
      Map<String, dynamic> queryParameters,
      Function(Response response) successListener,
      Function errorListener,
      String newBaseUrl: ""}) async {
    handleBaseUrl(newBaseUrl); //处理baseUrl改变的问题
    await _dio.delete(path, data: json.encode(queryParameters)).then(
          (response) => handNetRequest(response, context, successListener, errorListener, newBaseUrl),
          //统一的处理请求成功的方法
          onError: (e) => handNetError(e, errorListener: errorListener), //统一的处理请求失败的方法
        );
  }

  ///put请求
  void myPATCH(String path, BuildContext context,
      {data,
      Map<String, dynamic> queryParameters,
      Function(Response response) successListener,
      Function errorListener,
      String newBaseUrl: ""}) async {
    handleBaseUrl(newBaseUrl); //处理baseUrl改变的问题
    await _dio.patch(path, data: json.encode(queryParameters)).then(
          (response) => handNetRequest(response, context, successListener, errorListener, newBaseUrl),
          //统一的处理请求成功的方法
          onError: (e) => handNetError(e, errorListener: errorListener), //统一的处理请求失败的方法
        );
  }

  ///处理baseUrl请求
  void handleBaseUrl(String newBaseUrl) {
    if (newBaseUrl.isNotEmpty) {
      _dio.options.baseUrl = newBaseUrl;
    } else {
      if (_dio.options.baseUrl != Urls.BASE_URL) _dio.options.baseUrl = Urls.BASE_URL;
    }
  }

  //处理成功后的请求
  void handNetRequest(Response response, BuildContext context, Function(Response response) successListener,
      Function errorListener, String newBaseUrl) {
    if (response.statusCode == ExceptionHandle.success) {
      print(response.data.toString());
      if (newBaseUrl.isNotEmpty) {
        if (successListener != null) successListener(response);
        return; //是否是新的baseUrl地址
      }
      int code = response.data['code'];
      if (code == 0) {
        if (successListener != null) successListener(response);
      } else if (code == 1010 || code == 1012) {
        //token过期  处理指定的异常code

      } else if (code == 2001) {
        //账号注册但是未激活
        showToastWidget(MyToastWidget(text: getMsg(response)));
        if (errorListener != null) errorListener(getMsg(response));
        //Application.router.navigateTo(context, "${Routes.loginPage}?jumpPath=", transition: TransitionType.fadeIn); //跳转到激活页面
      } else {
        //处理返回的异常
        showToastWidget(MyToastWidget(text: getMsg(response).isEmpty ? "请求异常 code=$code" : getMsg(response)));
        if (errorListener != null) errorListener(getMsg(response));
      }
    }
  }

  //获取去msg 一个共有方法  有些地方 message 是没有的
  String getMsg(Response response) {
    try {
      return response.data['message'].toString();
    } catch (e) {
      print(e);
      return "";
    }
  }

  //处理失败的请求
  void handNetError(e, {Function errorListener}) {
    //处理全局网络异常
    NetError netError = ExceptionHandle.handleException(e);
    //处理网络请求的异常
    showToastWidget(MyToastWidget(text: netError.msg));
    if (errorListener != null) errorListener();
  }
}
