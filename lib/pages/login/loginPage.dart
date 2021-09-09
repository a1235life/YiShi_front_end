import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/global/global.dart';
import 'package:ingredients/global/login/globalmydata.dart';
import 'package:ingredients/pages/bottom/botAppBar.dart';
import 'package:http/http.dart' as http;
import 'package:ingredients/pages/login/registerPage.dart';
import 'package:ingredients/global/toast.dart';
import 'fingpswdpage.dart';
import 'dart:convert';
import 'dart:async';

class RootPage extends StatefulWidget {
  @override
  RootPageState createState() => new RootPageState();
}

class RootPageState extends State<RootPage> {
  //输入控制器
  TextEditingController _PhoneTextController = new TextEditingController();
  TextEditingController _PswdTextController = new TextEditingController();
  TextEditingController _TrueTextController = new TextEditingController();
  var _login;
  var _statusCode;
  //清除按钮
  var _isCleanAll = false;

  //密码是否可见
  var _isShowPswd = false;
  var _thisPhon = false;
  var _thisTrue=false;
  var _thisPswd = false;
  var _thisColor = false;

  //正在输入颜色
  Color inputcolor = Colors.green;

  //基础颜色
  Color normalcolor = Color(0x80fafafa);

  //手机号焦点控制
  FocusNode PhoneFieldNode = new FocusNode();

  //用户密码焦点控制
  FocusNode PswdFielNode = new FocusNode();
  FocusNode TrueFieldNode = new FocusNode();
//预加载图片
  @override
  void didChangeDependencies() {
    precacheImage(AssetImage("lib/assets/images/login/p_loginbg.jpg"), context);
        super.didChangeDependencies();
    }
  //生命周期函数 页面创建时执行一次
  @override
  void initState() {
    super.initState();
    //buildBg();
    PhoneFieldNode.addListener(_focusNodeListener);
    PswdFielNode.addListener(_focusNodeListener);
    TrueFieldNode.addListener(_focusNodeListener);
    PswdFielNode.addListener(() {
      print(_PswdTextController.text);
      //如果有文本输入
      if (_PswdTextController.text.length > 0) {
        _thisPswd = true;
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
    _TrueTextController.addListener(() {
      print(_TrueTextController.text);
      if (_TrueTextController.text.length > 0) {
        _isCleanAll = true;
        _thisTrue = true;
      } else {
        _isCleanAll = false;
      }

    });
  }
//手机号，密码框焦点监听
  Future<Null> _focusNodeListener() async {
    if (PhoneFieldNode.hasFocus) {
      print("已点入输入手机号框啦");
      setState(() {
        PswdFielNode.unfocus();
        TrueFieldNode.unfocus();
        _thisPhon = true;
        _thisColor = true;
      });
    } else {
      setState(() {
        _thisPhon = false;
      });
    }
    if (PswdFielNode.hasFocus) {
      print("已点入输入密码框啦");
      _thisColor = true;
      setState(() {
        PhoneFieldNode.unfocus();
        TrueFieldNode.unfocus();
        _thisPswd = true;
      });
    } else {
      _thisPswd = false;
    }
    if (TrueFieldNode.hasFocus) {
      print("已点验证码框啦");
      setState(() {
        PhoneFieldNode.unfocus();
        PswdFielNode.unfocus();
        _thisTrue = true;
        _thisColor = true;
      });
    } else {
      setState(() {
        _thisTrue = false;
      });
    }
  }

  //移除监听
  // @override
  // void dispose() {
  //    //TODO: implement dispose
  //   PhoneFieldNode.removeListener(_focusNodeListener);
  //   PswdFielNode.removeListener(_focusNodeListener);
  //   _PhoneTextController.dispose();
  //   super.dispose();
  //   setState(() {});
  // }
  //主结构
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    precacheImage(AssetImage("lib/assets/images/login/p_loginbg.jpg"), context);
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
        "lib/assets/images/login/p_loginbg.jpg",
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
          "益 食",
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
                margin: EdgeInsets.only(left: 22, right: 22, top: 55.0),
              ),
              //Logo
              buildLogo(),
              //间隔
              SizedBox(
                height: 30,
              ),
              //输入手机号框
              buildUserPhon(),
              SizedBox(
                height: 30,
              ),
              //输入密码框
              buildUserPswd(),
              // SizedBox(
              //   height: 30,
              // ),
              // buildUserTrue(),
              SizedBox(
                height: 30,
              ),
              //用户注册与忘记密码
              buildAgreement(),
              SizedBox(
                height: 40,
              ),
              buildRegister(),
            ],
          ),
        ));
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
          child: TextFormField(
            controller: _PhoneTextController,
            focusNode: PhoneFieldNode,
            //输入长度为11位
            inputFormatters: [
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
            onSubmitted: (value2) {
              print("$value2");
            },
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

  //输入验证码设定
  buildUserTrue() {
    return Container(
      child:
      // Row(
      // children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 22,
            right: 22,
          ),
          decoration: BoxDecoration(
            color: Color(0x50fafafa),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(
                color: TrueFieldNode.hasFocus ? inputcolor : normalcolor),
          ),
          child: buildIputTrue(),
        ),
      // ],
      // ),
    );

  }

  //用户输入验证码号框
  buildIputTrue() {
    return Container(
      child:Row(
      children: [
        //竖线
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width:30,
            height: 0,
            color: Color(0x50fafafa),
          ),
        ),
        //输入框
        Expanded(
          child: TextFormField(
            controller: _TrueTextController,
            focusNode: TrueFieldNode,
            //键盘样式
            keyboardType: TextInputType.phone,
            //输入文本的样式
            style: TextStyle(fontSize: 16.0, color: Colors.white),
            //输入的内容框控制
            decoration: InputDecoration(
              hintText: "请输入验证码",
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
                    _TrueTextController.clear();
                  })
                  : null,
            ),
          ),
        ),
      ],
    ),
    );

  }

//构建用户注册与忘记密码
  buildAgreement() {
    return Container(
      margin: EdgeInsets.only(left: 50, right: 22, top: 0),
      child: Row(
        children: <Widget>[
          Container(
            child: GestureDetector(
              child: Text(
                "注册",
                style: TextStyle(color: Color(0xaafafafa), fontSize: 18),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new ZhucePage()));
              },
            ),
          ),
          SizedBox(
            width: 100,
          ),
          Container(
            child: GestureDetector(
              child: Text(
                "忘记密码？",
                style: TextStyle(color: Color(0xaafafafa), fontSize: 18),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new FindPswdPage()));
              },
            ),
          ),
        ],
      ),
    );
  }

  //构建登录按钮
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
                setState(() {
                  if ((_PhoneTextController.text == "") ||( _PswdTextController == "")) {
                    ToastM.toast(
                      context,
                      msg: '账号密码不能为空',
                      textSize: 20.0,
                    );
                  } else {
                    getdata();
                  }
                });
              },

              child: Text(
                "登录",
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
  //链接后端
  Future getdata() async {
    print("点击登录了");
    var apiPhon = _PhoneTextController.text;
    var apiPswd = _PswdTextController.text;
    print('用户名$apiPhon');
    print('密码$apiPswd');
    //
    var url= 'http://47.98.201.222:8181/user/login/'+apiPhon+'/'+apiPswd;
     http.get(url)
        .then((response){
       print("状态:${response.statusCode}");
      print("正文:${response.body}");
       var jsonData =json.decode(response.body);
       print(jsonData['data']);
       globalmydata.set_username(jsonData['data']['username']);
       globalmydata.set_userid(jsonData['data']['phone']);
       globalmydata.set_usertrueemail(jsonData['data']['email']);
       _login=jsonData['msg'];
       _statusCode=response.statusCode;
       //print("11这到底是个什么$_login");
    });
    if(_statusCode==200) {
      if (_login == '登录成功') {
        ToastM.toast(
          context,
          msg: '登录成功咯',
        );
        setState(() {
          global.set_username(apiPhon);
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => BotAppBar()));
        });
      } else if(_login=="This phone number does not exist."){
        print("错了错了");
        ToastM.toast(
          context,
          msg: '账号不存在',
        );
      }
      else{
        ToastM.toast(
          context,
          msg: '密码错误',
        );
      }
    }
    // else{
    //   ToastM.toast(
    //     context,
    //     msg: '网络链接错误',
    //   );
    // }
  }


}
