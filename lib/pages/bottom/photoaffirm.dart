import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingredients/global/global.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:http/http.dart' as http;
import 'package:ingredients/global/toast.dart';

//拍照确认
class PhotoAffirm extends StatefulWidget {
  PhotoAffirm({Key key}) : super(key: key);
  @override
  _PhotoAffirmState createState() => _PhotoAffirmState();
}

class _PhotoAffirmState extends State<PhotoAffirm>{
  var response;
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    setState(() {
      _recognition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: IconFont(IconNames.fanhui, size: WidgetInfo.get_topIconSize(),color: WidgetInfo.get_topIconColor()),
            splashColor: Colors.transparent, //取消点击水波纹
            highlightColor: Colors.transparent, //取消点击水波纹
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "正在识别中",
            style: TextStyle(fontSize: WidgetInfo.get_topFontSize(),color:WidgetInfo.get_topFontColor()),
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              _Img(global.get_imagetitle()),
              SizedBox(
                width: 200,
              ),
              _text()
            ],
          ),
        )
    );
  }

  Widget _Img(image){
    return Container(
      margin: EdgeInsets.all(Adapt.px(5)),
      child: Card(
        //设置圆角
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(Adapt.px(16)))),
        elevation: Adapt.px(5), //阴影高度
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(Adapt.px(10)),
              padding: EdgeInsets.all(Adapt.px(5)),
              child: Image.file(image, height: 200,),
            )
          ],
        ),
      ),
    );
  }
  Widget _text(){
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Adapt.px(5)))),
        elevation: Adapt.px(0), //阴影高度
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(Adapt.px(10)),
              padding: EdgeInsets.all(Adapt.px(5)),
              child: Text(
                " 识别中请稍等。。。",
                style: TextStyle(fontSize: Adapt.px(30)),
              ),
            )
          ],
        ),
      ),
    );
  }
Future _recognition() async {
  String imageBase; //存储Base64字符串
  String strPath = global.get_imagetitle().toString().substring(8, global.get_imagetitle()
      .toString()
      .length - 1);
  imageBase = await EncodeUtil.image2Base64(strPath); //将图片路径将图片转换成Base64字符串
  var url = "http://47.98.201.222:8181/food/picture";
  print("请求发送");
  response = await http.post(url,
      body: imageBase);
  print(response.statusCode);
  global.set_isopenphoto(response.statusCode);
  setState(() {
    var json= jsonDecode(response.body);
    global.set_allname(json['pic']);
    global.set_name(json['name']);
    global.set_nickname(json['nickname']);
    global.set_calorie(json['calorie']);
    global.set_classification(json['classification']);
    global.set_introduction(json['introduction']);
    global.set_suitable(json['suitable']);
    global.set_unsuitable(json['unsuitable']);
    global.set_picture_name1(json["recipe"][0]["recipe_name"]);
    global.set_picture_link1(json["recipe"][0]["picture_link"]);
    global.set_picture_url1(json["recipe"][0]["url"]);
    global.set_picture_name2(json["recipe"][1]["recipe_name"]);
    global.set_picture_link2(json["recipe"][1]["picture_link"]);
    global.set_picture_url2(json["recipe"][1]["url"]);
  });
  if (response.statusCode == 200) {
    setState(() {
      Navigator.pushNamed(context, '/first');
      showModalBottomSheet(context: context, builder: (BuildContext context){
        return Column(
          children: [
            _showimg(global.get_allname(),global.get_name()),
          ],
        );
      });

    });
  }else if(response.statusCode == 500){
    ToastM.toast(
      context,
      msg: '网络异常',
      textSize: 20.0,
    );
  }else if(response.statusCode == 504){
    ToastM.toast(
      context,
      msg: '网络链接超时',
      textSize: 20.0,
    );
  }
}
Widget _showimg(image,name){
  return Column(
    children: [
      new Container(
        padding: EdgeInsets.only(top: 30),
        child: Text(
          "是你感兴趣的食材吗？",
          style: TextStyle(fontSize: Adapt.px(40)),
        ),
      ),
      new Container(
        padding: EdgeInsets.only(top: 10),
        margin: EdgeInsets.all(Adapt.px(20)),
        width: Adapt.px(300),
        height: Adapt.px(300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              image,
            ),
          ),
        ),
      ),
      new Container(
        child: Text(
          name,
          style: TextStyle(fontSize: Adapt.px(45)),
        ),
      ),
      new Container(
        padding: EdgeInsets.only(top: 10),
        child: GestureDetector(
          child: Text(
            "查看详情",
            style: TextStyle(color: Colors.blueAccent, fontSize: 18),
          ),
          onTap: () {
            _putadd();
            Navigator.pushNamed(context, '/PhotoResultPage');
          },
        ),
      ),
    ],
  );
}
Future _putadd() async{
    var url="http://47.98.201.222:8181/rate/statistics";
    var  response=await http.put(url,
        headers: {
          'Content-type': 'application/json',
          "Accept": 'application/json'
        },
        body:"1"
    );
    print(response.statusCode);
}
}


class EncodeUtil {
  static Future image2Base64(String path) async {
    File file = new File(path);
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }

}

