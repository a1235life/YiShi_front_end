import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:ingredients/assets/fonts/iconFonts/iconFont.dart';//阿里云图标
import 'package:fluttertoast/fluttertoast.dart';//弹框
import 'package:ingredients/global/Adapt.dart';
import 'package:image_picker/image_picker.dart';//获取图片
import 'package:ingredients/global/global.dart';
import 'package:http/http.dart' as http;
import 'package:ingredients/global/toast.dart';
//底部导航，4个tab
import 'package:ingredients/pages/article/articlePage.dart';
import 'package:ingredients/pages/home/homePage.dart';
import 'package:ingredients/pages/log/logPage.dart';
import 'package:ingredients/pages/mine/minePage.dart';

class BotAppBar extends StatefulWidget {
  BotAppBar({Key key}) : super(key: key);

  @override
  _BotAppBarState createState() => _BotAppBarState();
}

class _BotAppBarState extends State<BotAppBar> {
  PageController pageController;
  int page = 0;
  int lastTime = 0;
  double iconSize = Adapt.px(40);
  double fontSize = Adapt.px(20);
  File _imagePath; //存储图片

  var response;

  //点击拍照按钮的点击事件
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
                  //Navigator.pushNamed(context, "/PhotoPages");
                  print("点击了相机！");
                },
                child: Text("相机"),
              ),
              CupertinoActionSheetAction(
                  onPressed: (){
                    Navigator.pop(context);//撤回弹框
                    _openGallery();
                    //Navigator.pushNamed(context, "/PhotoPages");
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

  //拍照
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
  //裁剪图片
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
      global.set_imagetitle(_imagePath);
      setState(() {
        Navigator.pushNamed(context, "/PhotoAffirm");
      });
    }
  }

  //从相册获取图片
  Future _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _imagePath = image;
        print("从相册获取食材图片成功！");
        print("裁剪前的图片路径: ${_imagePath}"); //打印获取的图片，得到的是图片的路径
        _cropImage(); //裁剪图片
      } else {
        print("从相册获取食材图片失败！");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //getallfood();
    pageController = PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  void _onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }

  void _onTap(int value) {
    pageController.animateToPage(
        value, duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }

  Color getColor(int value) {
    return this.page == value
        ? Colors.green
        : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope( //错误触碰返回按钮，返回拦截
        child: Scaffold(
          body: PageView(
            children: [HomePage(), ArticlePage(), LogPage(), MinePage()],
            physics: NeverScrollableScrollPhysics(), //设置禁止滑动
            onPageChanged: _onPageChanged,
            controller: pageController,
          ),

          floatingActionButton: FloatingActionButton(
              child: Icon(IconFont.icon_paizhao, color: Colors.white,),
              onPressed: () {//点击拍照按钮的点击事件
                showBottomDialog(context);
              }
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            child: Container(
              height: Adapt.px(110),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          _onTap(0);
                        },
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                  child: Icon(IconFont.icon_daohangshouye, color: getColor(0), size: iconSize,)
                              ),
                              Text("首页", style: TextStyle(color: getColor(0), fontSize: fontSize))
                            ],
                          ),
                        )
                    ),
                    GestureDetector(
                      onTap: () {
                        _onTap(1);
                      },
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Icon(IconFont.icon_wenzhangguanli, color: getColor(1), size: iconSize),
                            ),
                            Text("文展", style: TextStyle(
                                color: getColor(1), fontSize: fontSize)),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          IconFont.icon_paizhao,
                          color: Colors.transparent,
                          size: iconSize,
                        ),
                        new Container(
                          padding: EdgeInsets.only(bottom: 0),
                          margin: EdgeInsets.only(top: Adapt.px(10)),
                          child: Text("食材识别", style: TextStyle(color: Colors.grey, fontSize: fontSize)),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        _onTap(2);
                      },
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Icon(IconFont.icon_wj_rz, color: getColor(2), size: iconSize),
                            ),
                            Text("笔记", style: TextStyle(color: getColor(2), fontSize: fontSize)),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _onTap(3);
                      },
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child:  Icon(IconFont.icon_wode, color: getColor(3), size: iconSize),
                            ),
                            Text("我的", style: TextStyle(color: getColor(3), fontSize: fontSize))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ),
        onWillPop: () {
          int newTime = DateTime.now().millisecondsSinceEpoch;
          int result = newTime - lastTime;
          lastTime = newTime;
          if (result > 2000) {
            Fluttertoast.showToast(
              msg: '再按一次退出!',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
            );
          } else {
            SystemNavigator.pop();
          }
          return null;
        }
    );
  }
}

//通过图片路径将图片转换成Base64字符串
class EncodeUtil {
  static Future image2Base64(String path) async {
    File file = new File(path);
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }

}