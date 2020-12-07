import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_demo_pro/net/exception_handle.dart';
import 'package:flutter_demo_pro/util/my_constants.dart';
import 'package:sp_util/sp_util.dart';

///拦截器
class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    String accessToken = SpUtil.getString(MyContstants.spToken, defValue: '');
    if (accessToken.isNotEmpty) {
      options.headers["token"] = "$accessToken";
      options.headers["isFlutter"] = "true";
    }

    return super.onRequest(options);
  }

//  @override
//  Future onResponse(Response response) {
//    //考虑加入token续期 让用户token过期时长延长
//    if(response.headers.map.containsKey("token")){
//
//    }
//    return super.onResponse(response);
//  }


}

class LoggingInterceptor extends Interceptor {
  DateTime startTime;
  DateTime endTime;

  @override
  onRequest(RequestOptions options) {
    startTime = DateTime.now();
    log("----------Start----------");
    if (options.queryParameters.isEmpty) {
      log("RequestUrl: " + options.baseUrl + options.path);
    } else {
      log("RequestUrl: " +
          options.baseUrl +
          options.path +
          "?" +
          Transformer.urlEncodeMap(options.queryParameters));
    }
    log("RequestMethod: " + options.method);
    log("RequestHeaders:" + options.headers.toString());
    log("RequestContentType: ${options.contentType}");
    log("RequestData: ${options.data.toString()}");
    return super.onRequest(options);
  }

  @override
  onResponse(Response response) {
    endTime = DateTime.now();
    int duration = endTime.difference(startTime).inMilliseconds;
    if (response.statusCode == ExceptionHandle.success) {
      log("ResponseCode: ${response.statusCode}");
    } else {
      log("ResponseCode: ${response.statusCode}");
    }
    // 输出结果
    log(response.data.toString());
    log("----------End: $duration 毫秒----------");
    return super.onResponse(response);
  }

  @override
  onError(DioError err) {
    log("----------Error-----------");
    return super.onError(err);
  }
}
