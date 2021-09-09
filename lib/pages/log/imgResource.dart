import 'dart:io';

/**
 * 从PickImage类 获取到的 图片路径
 */
class ImgResource{
  File _imagePath;

  ImgResource(){}

  File get_imagePath(){
//    print("ImgResource---get_imagePath()输出："+_imagePath.toString());
    return _imagePath;
  }

  void set_imagePath(File value) {
    _imagePath = value;
    print("ImgResource---set_imagePath()输出："+_imagePath.toString());
  }
}