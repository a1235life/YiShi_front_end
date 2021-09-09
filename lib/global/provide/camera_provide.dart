import 'dart:io';
import 'package:flutter/material.dart';


class CAMERA_PROVIDE with ChangeNotifier{

  File imagePath;//拍照或者相册  获取到的图片路径

  getImagePath(File imagePath){ //不用管理听众
    imagePath = imagePath;
    notifyListeners(); //变化后通知听众，局部刷新Widget
  }
}