
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DBUtils.dart';
import 'WebPage.dart';
import 'file_entity.dart';

import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';

class CollectionPage extends StatefulWidget {
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  List<Result> results = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DBUtils.instance().then((value){
      value.getAllDownloadGames().then((value){
        results.clear();
        results.addAll(value);
        setState(() {

        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   title: Text("我的收藏"),
      //   actions: [
      //   ],
      // ),
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
          "我的收藏",
          style: TextStyle(fontSize: WidgetInfo.get_topFontSize(),color:WidgetInfo.get_topFontColor()),
        ),
      ),
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: results.length,
            itemBuilder: (context, index) {
              return Card(
                child: Material(
                  child: Ink(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebPage(
                                  url: results[index],
                                ))).then((value){
                          DBUtils.instance().then((value){
                            value.getAllDownloadGames().then((value){
                              results.clear();
                              results.addAll(value);
                              setState(() {

                              });
                            });
                          });
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Image.network(
                              '${results[index].coverPic}',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.collections_bookmark_rounded,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      results[index].articleName,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
