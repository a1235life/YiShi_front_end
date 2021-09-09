import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/global/WidgetInfo.dart';

import 'CollectionPage.dart';
import 'Http.dart';
import 'WebPage.dart';
import 'file_entity.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {

  List<Result> results = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Http.instance.getDate({}, onSuccessful: (data) {
      results.addAll(FileEntity.fromJson(data).result);
      results.sort((left,right)=>right.score.compareTo(left.score));
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : false,
        backgroundColor: Colors.green,
        title: Text("健康小贴文"),
        actions: [
         // IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.collections_bookmark_rounded), onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CollectionPage()));
          }),
          // IconButton(icon: Icon(Icons.share), onPressed: () {
          // })
        ],
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
                                )));
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
                                  // Expanded(
                                  //     child:  Text(
                                  //       results[index].score,
                                  //       style: TextStyle(fontSize: 16),
                                  //     )
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                
                                // Text(
                                //   results[index].weight.toString(),
                                //   style: TextStyle(color: Colors.grey),
                                // ),
                                Text(
                                  results[index].score.toString(),
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
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