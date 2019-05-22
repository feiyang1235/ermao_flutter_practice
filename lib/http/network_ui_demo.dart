import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/User.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    routes: {},
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  User user;
  String msg;
  int i = 0;

  void getUserInfo(String userName) {
    http.get("https://api.github.com/users/$userName").then((response) {
      setState(() {
        final responseJson = json.decode(response.body);
        user = new User.fromJson(responseJson); //传入json对象，通过命名构造函数得到user对象
        print(user.avatarUrl);
      });
    }).catchError((error) {
      print("请求失败：" + error.toString());
    }).whenComplete(() {
      print("请求完成");
    });
//    InheritedWidget
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    f();
  }

  void changeText(msg) {
    setState(() {
      this.msg = msg;
    });
  }

  void f() {
    new Future(() {
      msg = '我';
    }).then((_) {
      //此下划线提示getGameConfig方法的执行对下面的代码有重要影响（主要是这个参数：Game.game_config_value）
      var timer;
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        setState(() {
          msg = msg + "ovo";
        });
      });
//      (timer as Timer).
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        new TextEditingController(text: "feiyang1235");
    return Scaffold(
      appBar: AppBar(
        title: Text("网络操作"),
      ),
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new Container(
              child: Image.network(user != null && user.name != null
                  ? user.avatarUrl
                  : "https://avatars1.githubusercontent.com/u/6630762?v=4"),
              //一个显示图片的widget
              width: 50.0,
              height: 50.0,
              margin: EdgeInsets.only(top: 20),
            ), //一个拥有绘制、定位、调整大小的 widget。
            new ListTile(
              leading: Icon(Icons.person),
              title: Text("name:" +
                  (user != null && user.name != null ? user.name : "暂无")),
              onTap: () => print("点击了名字！"),
            ), //一个固定高度的行，通常包含一些文本，以及一个行前或行尾图标。
            new ListTile(
              leading: Icon(Icons.location_city),
              title: Text("location:" +
                  (user != null && user.location != null
                      ? user.location
                      : "暂无")),
            ),
            new ListTile(
                leading: Icon(Icons.web),
                title: Text("blog:" +
                    (user != null && user.blog != null ? user.blog : "暂无"))),
            new ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text("company:" +
                    (user != null && user.company != null
                        ? user.company
                        : "暂无"))),
            new ListTile(
              leading: Icon(Icons.http),
              title: Text("html_url:" +
                  (user != null && user.htmlUrl != null ? user.htmlUrl : "暂无")),
            ),
            new TextField(
              decoration: InputDecoration(labelText: "请输入你的github用户名"),
              controller: controller,
            ), //文本输入框
            RaisedButton(
              onPressed: () {
                getUserInfo(controller.text.toString());
              },
              child: Text("Get请求"),
            ), //Material Design中的button， 一个凸起的材质矩形按钮
            RaisedButton(
              onPressed: () {
                changeText("我叫冯飞杨${i++}");
              },
              child: Text(msg == null ? "我爱Flutter" : msg),
            ),
          ],
        ), //在垂直方向上排列子widget的列表。
      ),
    );
  }
}
