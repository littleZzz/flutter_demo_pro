//num 数的 扩展函数
extension strExt on String {
  ///格式化字符串
  String formatStr() {
    var name = this;
    if (name == null || "null" == name || name.isEmpty) {
      return "";
    } else {
      return name;
    }
  }

  ///格式化图片资源的路径
  String imgPath({String format: 'png'}) {
    return 'assets/$this.$format';
  }
}
