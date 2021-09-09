import 'package:flutter/material.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/global.dart';



/**
 * 相克搭配  信息展示页面
 */
class MatchPage extends StatefulWidget {
  MatchPage({Key key}) : super(key: key);

  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: IconFont(
            IconNames.fanhui,
            size: Adapt.px(40),
            color: "white",
          ),
          splashColor: Colors.transparent, //取消点击水波纹
          highlightColor: Colors.transparent, //取消点击水波纹
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "相克搭配",
          style: TextStyle(fontSize: Adapt.px(40)),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                XiangKeDaPei(),//调用相克搭配信息
              ],
            )
          ],
        ),
      ),
    );
  }

  //相克搭配信息
  XiangKeDaPei(){
          return Column(
            children: [
              _foodImg(global.get_allname(),
                  global.get_name()),
              _foodRestriction(global.get_conflict()),
              _foodMatch(global.get_mate(),),
              _foodAppropriateCrowd(global.get_suitable()),
              _foodTabooCrowd(global.get_unsuitable())
            ],
          );

  }

  //样图
  Widget _foodImg(image,name){
    return Container(
      margin: EdgeInsets.only(top: Adapt.px(30),bottom: Adapt.px(20)),
      child: Column(
        children: [
          new Container(
            margin: EdgeInsets.only(bottom: Adapt.px(20)),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(Adapt.px(300)))),
              elevation: Adapt.px(10), //阴影高度
              child: Container(
                width: Adapt.px(300),
                height: Adapt.px(300),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        image
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: Adapt.px(50)),
          ),
        ],
      ),
    );
  }

//  食物相克
  Widget _foodRestriction(restriction){
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Adapt.px(5)))),
        elevation: Adapt.px(10), //阴影高度
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //食物相克
            new Container(
              child: Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(right: Adapt.px(10)),
                    child: IconFont(IconNames.jinggao,size: Adapt.px(40),),
                  ),
                  Expanded(
                    child: new Container(
                      child: Text("食物相克",style: TextStyle(color: Colors.red,fontSize: Adapt.px(40),letterSpacing: Adapt.px(5)),),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.red,
                      width: Adapt.px(2),
                    )
                ),
              ),
            ),
            //相克内容
            new Container(
              margin: EdgeInsets.all(Adapt.px(10)),
              padding: EdgeInsets.all(Adapt.px(5)),
              child: Text(
                restriction,
                style: TextStyle(fontSize: Adapt.px(40)),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: Adapt.px(2),
                  ),
                  borderRadius:
                  BorderRadius.circular(Adapt.px(15))),
            )
          ],
        ),
      ),
    );
  }

//食物搭配
  Widget _foodMatch(match){
    return Container(
      margin: EdgeInsets.only(top: Adapt.px(20)),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Adapt.px(5)))),
        elevation: Adapt.px(10), //阴影高度
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //食物搭配
            new Container(
              child: Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(right: Adapt.px(10)),
                    child: IconFont(IconNames.wancheng,size: Adapt.px(40),),
                  ),
                  Expanded(
                    child: new Container(
                      child: Text("食物搭配",style: TextStyle(color: Colors.green,fontSize: Adapt.px(40),letterSpacing: Adapt.px(5)),),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.green,
                      width: Adapt.px(2),
                    )
                ),
              ),
            ),
            //搭配内容
            new Container(
              margin: EdgeInsets.all(Adapt.px(10)),
              padding: EdgeInsets.all(Adapt.px(10)),
              child: Text(
                match,
                style: TextStyle(fontSize: Adapt.px(40)),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: Adapt.px(2),
                  ),
                  borderRadius:
                  BorderRadius.circular(Adapt.px(15))),
            ),
          ],
        ),
      ),
    );
  }

//适宜人群
  Widget _foodAppropriateCrowd(appropriate_crowd){
    return Container(
      child: Card(
        //设置圆角
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(Adapt.px(5)))),
          elevation: Adapt.px(5), //阴影高度
          child: Container(
            padding: EdgeInsets.all(Adapt.px(10)),
            child: Column(
              children: [
                new Container(
                  child: Row(
                    children: [
                      new Container(
                        child: IconFont(IconNames.ziyuan,size: Adapt.px(40),),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(Adapt.px(10)),
                          child: Text(
                            "适宜人群：",
                            style: TextStyle(color: Colors.green,fontSize: Adapt.px(40),letterSpacing: Adapt.px(5)),),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.green,
                        width: Adapt.px(2),
                      ),
                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(Adapt.px(10)),
                  padding: EdgeInsets.all(Adapt.px(10)),
                  child: Text(
                    appropriate_crowd,
                    style: TextStyle(fontSize: Adapt.px(40)),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: Adapt.px(2),
                      ),
                      borderRadius:
                      BorderRadius.circular(Adapt.px(15))),
                )
              ],
            ),
          )),
    );
  }

  //禁忌人群
  Widget _foodTabooCrowd(taboo_crowd){
    return Container(
      child: Card(
        //设置圆角
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(Adapt.px(5)))),
          elevation: Adapt.px(5), //阴影高度
          child: Container(
            padding: EdgeInsets.all(Adapt.px(10)),
            child: Column(
              children: [
                new Container(
                  child: Row(
                    children: [
                      new Container(
                        child: IconFont(IconNames.kulian,size: Adapt.px(40),),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(Adapt.px(10)),
                          child: Text(
                            "禁忌人群：",
                            style: TextStyle(color: Colors.black,fontSize: Adapt.px(40),letterSpacing: Adapt.px(5)),),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.red,
                        width: Adapt.px(2),
                      ),
                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(Adapt.px(10)),
                  padding: EdgeInsets.all(Adapt.px(10)),
                  child: Text(
                    taboo_crowd,
                    style: TextStyle(fontSize: Adapt.px(40)),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: Adapt.px(2),
                      ),
                      borderRadius:
                      BorderRadius.circular(Adapt.px(15))),
                )
              ],
            ),
          )),
    );
  }

}