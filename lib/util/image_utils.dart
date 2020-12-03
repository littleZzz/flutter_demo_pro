import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_pro/extension/string_extension.dart';

class ImageUtils {
  static ImageProvider getAssetImage(String name, {String format: 'png'}) {
    return AssetImage(name.imgPath(format: format));
  }

//  static ImageProvider getImageProvider(String imageUrl, {String holderImg: "none"}){
//    if (TextUtil.isEmpty(imageUrl)){
//      return AssetImage(getImgPath(holderImg));
//    }
//    return CachedNetworkImageProvider(imageUrl);
//  }
}
