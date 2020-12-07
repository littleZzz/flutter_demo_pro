///存放常量数据
class MyContstants {
  ///一下是sp的常量值
  static String spToken = 'sp_token';
  static String spUserId = 'sp_UserId';
  static String spStoreId = 'sp_StoreId';
}

///下面是枚举类
//用户的状态   // 没有门店信息// 门店待激活(审核中)// 门店不激活(驳回)// 门店激活不可用     门店激活可用 NORMAL
enum UserStatus { NOT_SUBMIT, INIT, REFUSED, DISABLE, NORMAL }

///页面访问记录的枚举类 1首页瀑布 2分类菜单 3我的收藏 4秒杀列表 5特价列表 6买赠列表 7搜索
enum PageVisitLog { L101, L102, L103, L104, L105, L106, L107 }

///跟新dialog的下载状态
enum UpdateStatus { UnStart, LoadError, Loading, LoadSucc }

///订单页面 订单列表类型的标记
enum OrderPageFlag { All, NeedPay, Toady, Receive, Evluate }

///主页tab页面的标记
enum TabMark { Home, All, Quick, Cart, Me }
