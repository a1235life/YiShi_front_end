import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/global/login/register.dart';
import 'package:ingredients/global/toast.dart';
import 'package:ingredients/pages/login/loginPage.dart';

class ZhucePage extends StatefulWidget{
  @override
  ZhucePageState createState() => new ZhucePageState();
}
class ZhucePageState extends State<ZhucePage>{

//输入控制器
  TextEditingController _NameTextController =new TextEditingController();
  TextEditingController _YesPswdTextController =new TextEditingController();
  TextEditingController _PhoneTextController = new TextEditingController();
  TextEditingController _PswdTextController = new TextEditingController();
  //指定框
  var _isShowPswd=false;
  var _isCleanAll=false;
  var _isShoePswd=false;
  var _thisPhon=false;
  var _thisPswd=false;
  var _thisYesPswd=false;
  var _thisName=false;
  //颜色
  Color inputcolor=Colors.green;
  Color normalcolor=Color(0x80fafafa);
  //焦点
  FocusNode PhoneFieldNode=new FocusNode();
  FocusNode PswdFielNode=new FocusNode();
  FocusNode YesPswdFielNode=new FocusNode();
  FocusNode NameNode=new FocusNode();
  //焦点控制
  @override
  void initState() {
    PhoneFieldNode.addListener(_focusNodeListener);
    PswdFielNode.addListener(_focusNodeListener);
    YesPswdFielNode.addListener(_focusNodeListener);
    NameNode.addListener(_focusNodeListener);
    PswdFielNode.addListener(() {
      print(_PswdTextController.text);
      //如果有文本输入
      if (_PswdTextController.text.length > 0) {
        _thisPswd = true;
      }
      setState(() {});
    });
    YesPswdFielNode.addListener(() {
      print(_YesPswdTextController.text);
      //如果有文本输入
      if (_YesPswdTextController.text.length > 0) {
        _thisYesPswd = true;
      }
      setState(() {});
    });
    //手机号输入文本控制
    _PhoneTextController.addListener(() {
      print(_PhoneTextController.text);
      if (_PhoneTextController.text.length > 0) {
        _isCleanAll = true;
        _thisPhon = true;
      } else {
        _isCleanAll = false;
      }
      setState(() {});
    });
    _NameTextController.addListener(() {
      print(_NameTextController.text);
      if (_NameTextController.text.length > 0) {
        _isCleanAll = true;
        _thisName = true;
      } else {
        _isCleanAll = false;
      }
      setState(() {});
    });
    buildBg();
    //构建影音层
    buildBlurBg();
    super.initState();
  }
  //输入框监听
  Future<Null> _focusNodeListener() async {
    if (PhoneFieldNode.hasFocus) {
      print("已点入输入手机号框啦");
      setState(() {
        PswdFielNode.unfocus();
        NameNode.unfocus();
        YesPswdFielNode.unfocus();
        _thisPhon = true;
      });
    } else {
      setState(() {
        _thisPhon = false;
      });
    }
    if (NameNode.hasFocus) {
      print("已点入输入用户名框啦");
      setState(() {
        PswdFielNode.unfocus();
        PhoneFieldNode.unfocus();
        YesPswdFielNode.unfocus();
        _thisName = true;
      });
    } else {
      setState(() {
        _thisName = false;
      });
    }
    if (PswdFielNode.hasFocus) {
      print("已点入输入密码框啦");
      setState(() {
        PhoneFieldNode.unfocus();
        NameNode.unfocus();
        YesPswdFielNode.unfocus();
        _thisPswd = true;
      });
    } else {
      _thisPswd = false;
    }
    if (YesPswdFielNode.hasFocus) {
      print("已点入验证密码框啦");
      setState(() {
        PhoneFieldNode.unfocus();
        NameNode.unfocus();
        PswdFielNode.unfocus();
        _thisYesPswd = true;
      });
    } else {
      _thisYesPswd = false;
    }
  }

  //主结构
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
            //构建背景
            buildBg(),
            //构建影音层
            buildBlurBg(),
            //用户输入框
            buildLoginInput(),
          ],
        ),
        onTap: () {
          //隐藏键盘
          SystemChannels.textInput.invokeMethod("TextInpt.hide");
          //输入框失去焦点
          PswdFielNode.unfocus();
          PhoneFieldNode.unfocus();
          NameNode.unfocus();
          YesPswdFielNode.unfocus();
        },
      ),
    );
  }
//背景图片
  buildBg() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Image.asset(
        "lib/assets/images/login/p_zhucebg3.jpg",
        fit: BoxFit.fill,
      ),
    );
  }
  //阴影
  buildBlurBg() {
    return Container(
      color: Color.fromARGB(155, 100, 100, 100),
    );
  }
  //Logo
  buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          //圆角矩形
          child: ClipRRect(
            //四个角
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.asset(
              "lib/assets/images/login/logo.png",
              height: 44,
              width: 44,
            ),
          ),
          padding: EdgeInsets.only(right: 14),
        ),
        Text(
          "益  食",
          style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              //引入自定义字体
              fontFamily: "zit1"),
        )
      ],
    );
  }
  //登陆页面主体
  buildLoginInput() {
    //填充
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
                    icon: IconFont(IconNames.fanhui, size: WidgetInfo.get_topIconSize(),color: WidgetInfo.get_topIconColor()),
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
              //Logo
              buildLogo(),
              //间隔
              SizedBox(
                height: 30,
              ),
              //输入用户名框
              buildUserName(),
              SizedBox(
                height: 20,
              ),
              //输入手机号框
              buildUserPhon(),
              SizedBox(
                height: 20,
              ),
              //输入密码框
             buildUserPswd(),
              SizedBox(
                height: 20,
              ),
              buildYesPswd(),
              SizedBox(
                height: 30,
              ),
              buildRegister(),
            ],
          ),
        ));
  }
//用户输入昵称框设定
  buildUserName() {
    return Container(
      margin: EdgeInsets.only(
        left: 22,
        right: 22,
      ),
      decoration: BoxDecoration(
        color: Color(0x50fafafa),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(
            color: NameNode.hasFocus ? inputcolor : normalcolor),
      ),
      child: buildIputName(),
    );
  }
//设置昵称输入框
  buildIputName() {
    return Row(
      children: [
        //左侧小图标
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.perm_contact_cal,
            color: Color(0xaafafafa),
            size: 26,
          ),
        ),
        //竖线
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 1,
            height: 26,
            color: Color(0xaafafafa),
          ),
        ),
        //输入框
        Expanded(
          child: TextFormField(
            controller: _NameTextController,
            focusNode: NameNode,
            //输入长度为11位
            inputFormatters: [
              LengthLimitingTextInputFormatter(11),
            ],
            //键盘样式
            keyboardType: TextInputType.text,
            //输入文本的样式
            style: TextStyle(fontSize: 16.0, color: Colors.white),
            //输入的内容框控制
            decoration: InputDecoration(
              hintText: "请输入昵称",
              hintStyle: TextStyle(color: Color(0xaafafafa)),
              border: InputBorder.none,
              suffixIcon: (_isCleanAll)
                  ? IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Color(0xaafafafa),
                  ),
                  onPressed: () {
                    _NameTextController.clear();
                    _PhoneTextController.clear();
                    _PswdTextController.clear();
                    _YesPswdTextController.clear();
                  })
                  : null,
            ),
          ),
        ),
      ],
    );
  }
  //输入手机号框设定
  buildUserPhon() {
    return Container(
      margin: EdgeInsets.only(
        left: 22,
        right: 22,
      ),
      decoration: BoxDecoration(
        color: Color(0x50fafafa),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(
            color: PhoneFieldNode.hasFocus ? inputcolor : normalcolor),
      ),
      child: buildIputPhon(),
    );
  }
//用户输入手机号框
  buildIputPhon() {
    return Row(
      children: [
        //左侧小图标
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.phone_android,
            color: Color(0xaafafafa),
            size: 26,
          ),
        ),
        //竖线
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 1,
            height: 26,
            color: Color(0xaafafafa),
          ),
        ),
        //输入框
        Expanded(
          child: TextField(
            controller: _PhoneTextController,
            focusNode: PhoneFieldNode,
            //输入长度为11位
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
            ],
            //键盘样式
            keyboardType: TextInputType.phone,
            //输入文本的样式
            style: TextStyle(fontSize: 16.0, color: Colors.white),
            //输入的内容框控制
            decoration: InputDecoration(
              hintText: "请输入手机号",
              hintStyle: TextStyle(color: Color(0xaafafafa)),
              border: InputBorder.none,
              suffixIcon: (_isCleanAll)
                  ? IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Color(0xaafafafa),
                  ),
                  onPressed: () {
                    _PhoneTextController.clear();
                    _PswdTextController.clear();
                  })
                  : null,
            ),
          ),
        ),
      ],
    );
  }
  //输入密码
  Widget buildUserPswd() {
    return Container(
      margin: EdgeInsets.only(
        left: 22,
        right: 22,
      ),
      decoration: BoxDecoration(
        color: Color(0x50fafafa),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border:
        Border.all(color: PswdFielNode.hasFocus ? inputcolor : normalcolor),
      ),
      child: buildIputPswd(),
    );
  }
  //输入密码框设定
  Widget buildIputPswd() {
    return Row(
      children: [
        //左侧小图标
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.lock_open,
            color: Color(0xaafafafa),
            size: 26,
          ),
        ),
        //竖线
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 1,
            height: 26,
            color: Color(0xaafafafa),
          ),
        ),
        //输入框
        Expanded(
          child: TextField(
            controller: _PswdTextController,
            focusNode: PswdFielNode,
            //点击键盘上的回车回调事件函数
            //参数{}获取二等是当前TextField中输入内容
            //键盘样式
            keyboardType: TextInputType.text,
            //输入文本的样式
            style: TextStyle(fontSize: 16.0, color: Colors.white),
            decoration: InputDecoration(
                hintText: "请输入密码",
                hintStyle: TextStyle(color: Color(0xaafafafa)),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  color: Color(0xaafafafa),
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
//验证密码
  buildYesPswd() {
    return Container(
      margin: EdgeInsets.only(
        left: 22,
        right: 22,
      ),
      decoration: BoxDecoration(
        color: Color(0x50fafafa),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border:
        Border.all(color: YesPswdFielNode.hasFocus ? inputcolor : normalcolor),
      ),
      child: buildYesInputPswd(),
    );
  }
//验证密码框设定
  buildYesInputPswd() {
    return Row(
      children: [
        //左侧小图标
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.lock_outline,
            color: Color(0xaafafafa),
            size: 26,
          ),
        ),
        //竖线
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 1,
            height: 26,
            color: Color(0xaafafafa),
          ),
        ),
        //输入框
        Expanded(
          child: TextField(
            controller: _YesPswdTextController,
            focusNode: YesPswdFielNode,
            //点击键盘上的回车回调事件函数
            //参数{}获取二等是当前TextField中输入内容
            onSubmitted: (value2) {
              print("$value2");
            },
            //键盘样式
            keyboardType: TextInputType.text,
            //输入文本的样式
            style: TextStyle(fontSize: 16.0, color: Colors.white),
            decoration: InputDecoration(
                hintText: "请再次输入密码",

                hintStyle: TextStyle(color: Color(0xaafafafa)),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  color: Color(0xaafafafa),
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
//注册按钮
  buildRegister() {
    return WillPopScope(
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(
      //       builder: (context) => new BotAppBar(),
      //   ));
      // },
      onWillPop: () async {
      },
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
              color: Color(0x50fafafa),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border.all(color: normalcolor),
            ),
            child: GestureDetector(
              onTap: () {
                PhoneFieldNode.unfocus();
                PswdFielNode.unfocus();
                NameNode.unfocus();
                YesPswdFielNode.unfocus();
                setState(() {
                  if (_NameTextController.text==''||_PhoneTextController.text == "" ||
                      _PswdTextController.text == ""||_YesPswdTextController.text=='') {
                    ToastM.toast(
                      context,
                      msg: '不能为空',
                    );
                  } else{
                    if(_PswdTextController.text!=_YesPswdTextController.text){
                      ToastM.toast(
                        context,
                        msg: '两次密码输入不一致',
                      );
                    }else if((_PhoneTextController.text).length<11){
                      ToastM.toast(
                        context,
                        msg: '请正确输入11位手机号',
                      );
                    }else{
                      getdata();
                  }
                  }
                });
              },

              child: Text(
                "注册",
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

  Future getdata() async {
    print("点击了注册");
    String apiPhon=_PhoneTextController.text;
    String apiPswd=_PswdTextController.text;
    String apiName=_NameTextController.text;
    var url='http://47.98.201.222:8181/user/register/userRegister';
    print(apiPswd);
    var _user=new Register(apiName, apiPswd,apiPhon);
    String json=jsonEncode(_user.toJson());
    print('用户名称${_user.toJson()}');
    print(json);
    var response=await http.put(url,
        headers: {
          'Content-type': 'application/json',
          "Accept": 'application/json'
        },
      body:json
    );
    print(response.statusCode);
    print(response.body);
    if(response.body=='This username already exists'){
      ToastM.toast(
        context,
        msg: '昵称已存在',
      );
    }
    if(response.body=='"This phone number has been registered'){
      ToastM.toast(
        context,
        msg: '手机号已被注册',
      );
    }
    if(response.body=='success'){
      ToastM.toast(
        context,
        msg: '注册成功',
      );
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => RootPage()));
    }
  }
}
