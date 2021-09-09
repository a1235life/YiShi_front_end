import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ingredients/pages/log/imgResource.dart';

/**
 * 底部弹框 ---> 拍照或者相册选择 ---> 裁剪
 */
class PickImage {
  File _imagePath; //存储图片
  ImgResource imgResource = new ImgResource();


  PickImage(BuildContext context){}

  //1.底部弹框
  showBottomDialog(context){
    return showModalBottomSheet(
      //底部弹框  IOS风格
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context){
          return CupertinoActionSheet(
            //操作按钮：相机、相册、取消
            actions: [
              CupertinoActionSheetAction(
                onPressed: (){
                  Navigator.pop(context);//撤回弹框
                  _takePhoto();
                  print("点击了相机！");
                },
                child: Text("相机"),
              ),
              CupertinoActionSheetAction(
                  onPressed: (){
                    Navigator.pop(context);//撤回弹框
                    _openGallery();
                    print("点击了从相册选择图片！");
                  },
                  child: Text("从相册选择图片")
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              //取消按钮
              onPressed: (){
                print("点击了取消按钮！");
                Navigator.pop(context);
              },
              child: Text("取消"),
            ),
          );
        }
    );
  }
  //2.拍照
  Future _takePhoto() async{
    //maxWidth和maxHeight是像素，改变图片大小
    final image = await ImagePicker.pickImage(source: ImageSource.camera, maxWidth:800, maxHeight:800);
    if (image != null) {
      _imagePath = image;
      print("拍摄食材成功！");
      _cropImage();
    }else{
      print("拍摄食材失败！");
    }
  }
  //3.相册获取图片
  Future _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _imagePath = image;
        print("从相册获取食材图片成功！");
        _cropImage(); //裁剪图片
      } else {
        print("从相册获取食材图片失败！");
      }
  }
  //3.裁剪
  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: _imagePath.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: '剪裁图片',
            toolbarColor: Colors.green,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: '剪裁图片',
        ));
    if (croppedFile != null) {
      _imagePath = croppedFile;
      imgResource.set_imagePath(croppedFile);//完成裁剪后，直接存储
//      print("PickImage---图片路径"+imgResource.get_imagePath().toString());
    }
  }

}
