import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/global/global.dart';
import 'package:ingredients/global/login/changepassword.dart';
import 'package:ingredients/global/toast.dart';
import 'package:http/http.dart' as http;

class ChangepswdPage extends StatefulWidget{

  @override
  ChangepswdPageState createState() => new ChangepswdPageState();
}

class ChangepswdPageState extends State<ChangepswdPage>{
  TextEditingController _PhoneTextController = new TextEditingController();

  FocusNode PhoneFieldNode=new FocusNode();
  var _isShowPswd = false;
  var _thisPhon = false;
  var _isCleanAll = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PhoneFieldNode.addListener(_focusNodeListener);
    //手机号输入文本控制
    _PhoneTextController.addListener(() {
      print(_PhoneTextController.text);
      if (_PhoneTextController.text.length > 0) {

        _thisPhon = true;
      }
    });
  }

  Future<Null> _focusNodeListener() async {
    if (PhoneFieldNode.hasFocus) {
      setState(() {
        _thisPhon = true;
        //  _thisColor = true;
      });
    } else {
      setState(() {
        _thisPhon = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //防止界面挤压
      resizeToAvoidBottomInset: false,
      //全局手势
      body: GestureDetector(
        //层叠布局
        child: Stack(
          children: [
            //用户输入框
            buildLoginInput(),
          ],
        ),
        onTap: () {
          //隐藏键盘
          SystemChannels.textInput.invokeMethod("TextInpt.hide");
          //输入框失去焦点
          PhoneFieldNode.unfocus();
        },
      ),
    );
  }

  buildLoginInput() {
    return Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          //竖直方向线性布局
          child: Column(
            children: [
              //顶部返回按钮
              Container(
                margin: EdgeInsets.only(top: Adapt.px(40)),
                child: ListTile(
                  leading: IconButton(
                    icon: IconFont(IconNames.fanhui, size: WidgetInfo.get_topIconSize(),
                      //color: WidgetInfo.get_topIconColor()
                    ),
                    color:Colors.black,
                    splashColor: Colors.transparent, //取消点击水波纹
                    highlightColor: Colors.transparent, //取消点击水波纹
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              //顶部距离
              Container(
                margin: EdgeInsets.only(left: 22, right: 22, top: 40.0),
              ),
              buildLogo(),
              //间隔
              SizedBox(
                height: 40,
              ),
              //输入手机号框
              buildUserPhon(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 90,
              ),
              buildRegister(),
            ],
          ),
        ));
  }

  buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Padding(
        //   //圆角矩形
        //   child: ClipRRect(
        //     //四个角
        //     borderRadius: BorderRadius.all(Radius.circular(8)),
        //     child: Image.asset(
        //       "lib/assets/images/login/my_icon.png",
        //       height: 44,
        //       width: 44,
        //     ),
        //   ),
        //   padding: EdgeInsets.only(right: 14),
        // ),
        Text(
          "重置密码",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  buildUserPhon() {
    return Container(
      margin: EdgeInsets.only(
        left: 22,
        right: 22,
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: buildIputPhon(),
    );
  }

  buildIputPhon() {
    return Row(
      children: [
        //左侧小图标
        // Padding(
        //   padding: EdgeInsets.only(left: 10),
        //   child: Icon(
        //     Icons.cloud_download_outlined,
        //     color: Color(0xaafafafa),
        //     size: 26,
        //   ),
        // ),
        // //竖线
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 1,
            height: 0,
            color: Colors.black12,
          ),
        ),
        //输入框
        Expanded(
          child: TextField(
            controller: _PhoneTextController,
            focusNode: PhoneFieldNode,

            //键盘样式
            keyboardType: TextInputType.text,
            //输入文本的样式
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            //输入的内容框控制
            decoration: InputDecoration(
              hintText: "请输入新密码",
              hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
                suffixIcon: IconButton(
                  color: Colors.black,
                  icon: Icon(
                      (_isShowPswd) ? Icons.visibility : Icons.visibility_off),
                  // 点击改变显示或隐藏密码
                  onPressed: () {
                    setState(() {
                      _isShowPswd = !_isShowPswd;
                    });
                  },
                )),
            obscureText: !_isShowPswd,
          ),
        ),
      ],
    );
  }

  buildRegister() {
    return WillPopScope(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 48,
            margin: EdgeInsets.only(
              left: 22,
              right: 22,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: GestureDetector(
              onTap: () {
                PhoneFieldNode.unfocus();
                setState(() {
                  if ((_PhoneTextController.text == "")) {
                    ToastM.toast(
                      context,
                      msg: '输入不能为空',
                      textSize: 20.0,
                    );
                  } else {
                    getdata();
                  }
                });
              },
              child: Text(
                "完成",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getdata() async{
    String apiPswd=_PhoneTextController.text;
    var url='http://47.98.201.222:8181/user/password_modify';
    var _pswd=new Changepassword(global.get_email(),apiPswd);
    print(global.get_email());
    String json=jsonEncode(_pswd.toJson());
    var response=await http.put(url,
        headers: {
          'Content-type': 'application/json',
          "Accept": 'application/json',
        },
        body:json
    );
    print(response.statusCode);
    if(response.statusCode==200){
      ToastM.toast(
        context,
        msg: '修改成功',
        textSize: 20.0,
      );
      Navigator.pushNamed(context, '/first');
    }
    print(response.body);
    print(utf8.decode(response.bodyBytes));
  }
}