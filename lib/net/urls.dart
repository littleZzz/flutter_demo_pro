
///存放所有网络请求的 地址信息
class Urls {
  ///true 表示是测试  false 表示是正式  dioUtil（抓包）
  static bool isDebug = true; //注意 友盟sdk统计 IOS Android配置不一样正式版本需要自己出来统计数据

  //存放全部的URL（可分为开发、测试、正式）
  static String BASE = isDebug ? "https://sm.zhangchuwang.cn/" : "https://mall.zhangchuwang.cn/";

//  static String BASE = "http://192.168.0.200:8110/";//mall.demo.com 开发环境 ip 访问去掉api

  /*开发环境*/
  static String BASE_URL = BASE + "api/"; //ip 访问本地  就不需要api
  static String BASE_IMG_URL = "https://img.zhangchuwang.cn/";

  ///一下是具体的api 地址
  static String login = "token"; //登录
//  static String getGoodsbill = "stores/${SpUtil.getInt(MyContstants.spStoreId)}/orderItem"; //获取商品清单数据


}
