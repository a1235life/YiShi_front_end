import 'package:flutter/material.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/global.dart';


/**
 * 挑选存储  信息展示页面
 */
class ChoosePage extends StatefulWidget {
  ChoosePage({Key key}) : super(key: key);

  @override
  _ChoosePageState createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
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
          "挑选存储",
          style: TextStyle(fontSize: Adapt.px(40)),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                TiaoXuanCunChu(),//调用挑选存储信息
              ],
            )
          ],
        ),
      ),
    );
  }

  //挑选存储信息
  TiaoXuanCunChu(){
          return Column(
            children: [
              _foodImg(global.get_allname(),
                  global.get_name()),
              _selectFood(global.get_choose()),
              _storageFood(global.get_storage()),
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

//  挑选
  Widget _selectFood(select){
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Adapt.px(5)))),
        elevation: Adapt.px(10), //阴影高度
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //挑选
            new Container(
              child: Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(right: Adapt.px(10)),
                    child: IconFont(IconNames.mb_efenggeduosetubiao_gouwuche,size: Adapt.px(60)),
                  ),
                  Expanded(
                    child: new Container(
                      child: Text("如何挑选？",style: TextStyle(color: Colors.deepOrange,fontSize: Adapt.px(40),letterSpacing: Adapt.px(5)),),
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
            //挑选内容
            new Container(
              margin: EdgeInsets.all(Adapt.px(10)),
              padding: EdgeInsets.all(Adapt.px(5)),
              child: Text(
                select,
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

//存储
  Widget _storageFood(storage){
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Adapt.px(5)))),
        elevation: Adapt.px(10), //阴影高度
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //挑选
            new Container(
              child: Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(right: Adapt.px(10)),
                    child: IconFont(IconNames.chucunguan,size: Adapt.px(40)),
                  ),
                  Expanded(
                    child: new Container(
                      child: Text("如何存储？",style: TextStyle(color: Colors.deepOrange,fontSize: Adapt.px(40),letterSpacing: Adapt.px(5)),),
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
            //挑选内容
            new Container(
              margin: EdgeInsets.all(Adapt.px(10)),
              padding: EdgeInsets.all(Adapt.px(5)),
              child: Text(
                storage,
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

}