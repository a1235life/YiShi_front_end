import 'package:flutter/material.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ingredients/global/global.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/pages/home/homeFoodInfo.dart';

/**
 * 食材百科信息展现页面的组件 组合
 * 食材图片来自本地 homeFoodInfo
 */
class FoodBaseInfoWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
        [
          _foodImg(global.get_allname()),
          _foodOneInfo(global.get_name(), global.get_nickname(), global.get_iclassification(), global.get_calorie()),
          _foodInfo(global.get_benefits()),
          _foodTwoInfo(global.get_introduction()),
          _foodRestriction(global.get_conflict()),
          _foodMatch(global.get_mate(),),
          _foodThreeInfo(global.get_suitable()),
          _foodFourInfo(global.get_unsuitable()),
          _selectFood(global.get_choose()),
          _storageFood(global.get_storage()),
          _foodMenu(
              global.get_picture_link1(),
              global.get_picture_name1(),
              global.get_picture_url1(),
              global.get_picture_link2(),
              global.get_picture_name2(),
              global.get_picture_url2(),),
        ]
    );
  }



  //本地图片
  Widget _foodImg(image){
    return Container(
      margin: EdgeInsets.all(Adapt.px(5)),
      child: Card(
        //设置圆角
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(Adapt.px(16)))),
        elevation: Adapt.px(5), //阴影高度
        child: Image.network(image,width: Adapt.px(320),height:Adapt.px(380),fit: BoxFit.fill,)
      ),
    );
  }




//名称、别名、分类、热量
  Widget _foodOneInfo(name,otherName,sort,calories){
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
              new Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    child: Text(
                      "名称：",
                      style: TextStyle(
                          fontSize: Adapt.px(35),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    padding: EdgeInsets.all(Adapt.px(5)),
                    child: Text(
                      name,
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
              new Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    child: Text(
                      "别名：",
                      style: TextStyle(
                          fontSize: Adapt.px(35),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: Adapt.px(10)),
                      padding: EdgeInsets.all(Adapt.px(5)),
                      child: Text(
                        otherName,
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
                  )
                ],
              ),
              new Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    child: Text(
                      "分类：",
                      style: TextStyle(
                          fontSize: Adapt.px(35),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    padding: EdgeInsets.all(Adapt.px(5)),
                    child: Text(
                      sort,
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
              new Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    child: Text(
                      "热量：",
                      style: TextStyle(
                          fontSize: Adapt.px(35),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    padding: EdgeInsets.all(Adapt.px(5)),
                    child: Text(
                      calories,
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
            ],
          ),
        ),
      ),
    );
  }
//食材功效
  Widget _foodInfo(introduce){
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
                new Row(
                  children: [
                    new Container(
                      width: Adapt.px(20),
                      height: Adapt.px(50),
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(Adapt.px(10)),
                        child: Text(
                          "食材功效：",
                          style: TextStyle(
                              fontSize: Adapt.px(40),
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: Adapt.px(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                new Container(
                  padding: EdgeInsets.all(Adapt.px(5)),
                  child: Text(
                    introduce,
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
//食材介绍
  Widget _foodTwoInfo(introduce){
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
                new Row(
                  children: [
                    new Container(
                      width: Adapt.px(20),
                      height: Adapt.px(50),
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(Adapt.px(10)),
                        child: Text(
                          "食材介绍：",
                          style: TextStyle(
                              fontSize: Adapt.px(40),
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: Adapt.px(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                new Container(
                  padding: EdgeInsets.all(Adapt.px(5)),
                  child: Text(
                    introduce,
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
  Widget _foodThreeInfo(appropriate_crowd){
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
                new Row(
                  children: [
                    new Container(
                      width: Adapt.px(20),
                      height: Adapt.px(50),
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(Adapt.px(10)),
                        child: Text(
                          "适宜人群：",
                          style: TextStyle(
                              fontSize: Adapt.px(40),
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: Adapt.px(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                new Container(
                  padding: EdgeInsets.all(Adapt.px(5)),
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
  Widget _foodFourInfo(taboo_crowd){
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
                new Row(
                  children: [
                    new Container(
                      width: Adapt.px(20),
                      height: Adapt.px(50),
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(Adapt.px(10)),
                        child: Text(
                          "禁忌人群：",
                          style: TextStyle(
                              fontSize: Adapt.px(40),
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: Adapt.px(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                new Container(
                  padding: EdgeInsets.all(Adapt.px(5)),
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

//菜谱
  Widget _foodMenu(menu1_image,menu1_name,menu1_url,menu2_image,menu2_name,menu2_url){
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
                new Row(
                  children: [
                    new Container(
                      width: Adapt.px(20),
                      height: Adapt.px(50),
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(Adapt.px(10)),
                        child: Text(
                          "食谱推荐：",
                          style: TextStyle(
                              fontSize: Adapt.px(40),
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: Adapt.px(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                new Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(Adapt.px(10)),
                            child: GestureDetector(
                              onTap: (){
                                _launchURL("$menu1_url");
                              },
                              child:  Column(
                                children: [
                                  //食谱图片
                                  new Container(
                                    child: InkWell(
                                      onTap: (){
                                        _launchURL("$menu1_url");
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(Adapt.px(15)),
                                        width: Adapt.px(200),
                                        height: Adapt.px(200),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              menu1_image,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //食谱名称
                                  new Container(
                                    child: Text(menu1_name,style:TextStyle(fontSize: Adapt.px(40)),),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(Adapt.px(10)),
                            child: GestureDetector(
                              onTap: (){
                                _launchURL("$menu2_url");
                              },
                              child:  Column(
                                children: [
                                  //食谱图片
                                  new Container(
                                    child: InkWell(
                                      onTap: (){
                                        _launchURL("$menu2_url");
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(Adapt.px(15)),
                                        width: Adapt.px(200),
                                        height: Adapt.px(200),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              menu2_image,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //食谱名称
                                  new Container(
                                    child: Text(menu2_name,style:TextStyle(fontSize: Adapt.px(40)),),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
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
            )
        ),
      ),
    );
  }

//菜谱点击响应     启动浏览器打开URL
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '不能打开 $url';
    }
  }

}
