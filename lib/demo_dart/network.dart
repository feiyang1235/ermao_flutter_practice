import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(new MaterialApp(home: new MyApp(),));
}

class MyApp extends StatelessWidget {

  var client = new http.Client();
  void httpGet() {
    print("请求开始");
    http.get("https://api.github.com/users/flyou").then((response) {
      print("请求内容："+response.body);
    }).catchError((error) {
      print("请求出错：" + error.toString());
    }).whenComplete(() {
      print("请求完成");
    });
  }

  @override
  Widget build(BuildContext context) {
//getData().then((response){
//  print("请求内容："+response.body);
//}).catchError((error){
//  print("请求内容 error："+error.toString());
//}).whenComplete((){
//  print("请求内容 complete：");
//});


//setData().then((response){
//  print("请求内容2：");
//  print("请求内容2：${response.runtimeType}");
//  print("请求内容2：${response.runtimeType}");
//  print("请求内容2 data：${data.body}");
//}).catchError((error){
//
//  print("请求内容2 error："+error.toString());
//}).whenComplete((){
//  print("请求内容2 complete：");
//});
setData1((rp){
  print("请求内容2 data：${rp.body}");
});
    return Scaffold(
      appBar: AppBar(
        title: Text("网络操作"),
      ),
      body: Center(
    child: Column(
      children: <Widget>[
        Container(
//          child: Image.network(user != null
//              ? user.avatar_url
//              : "https://avatars1.githubusercontent.com/u/6630762?v=4"),width: 50.0,height: 50.0,
        ),
        ListTile(

        ),
        ListTile(),
      ],
    ),
      ),
    );
  }
}


//HTTP的get请求返回值为Future<String>类型，即其返回值未来是一个String类型的值
getData()  {    //async关键字声明该函数内部有代码需要延迟执行
  return  http.get(Uri.encodeFull("https://api.github.com/users/feiyang1235"), headers: {"Accept": "application/json"}); //await关键字声明运算为延迟执行，然后return运算结果
}

getDataByClient(){
  var client = new http.Client();
  client.post(
      "http://example.com/wfs/create",
      body: {"name": "doodle", "color": "blue"})
      .then((response) => client.get(response.headers["uri"]))
      .then((response) => print(response.body))
      .whenComplete(client.close);
}

getDataByUserAgentClient(){
  var client = new http.Client();
  var userAgentClient = new UserAgentClient("aaa", client);
  userAgentClient.post(
      "http://example.com/wfs/create",
      body: {"name": "doodle", "color": "blue"})
      .then((response) => client.get(response.body))
      .then((response) => print("getDataByUserAgentClient ${response.body}"))
  .catchError((error)=>print(" getDataByUserAgentClient error ${error.toString()}"))
      .whenComplete((){
        // ignore: unnecessary_statements
        client.close;
        print("getDataByUserAgentClient complete");
  });
}
http.Response data;
setData()  async{
  data = await getData(); //getData()延迟执行后赋值给data
}
http.Response data1;
setData1(Function f(rp))  async{
 await getData().then((response){
    data1 = response;
    print("请求内容222 data：${response.runtimeType}");
    print("请求内容222 data：${response.body}");
    print("请求内容222 data123：${data1.body}");
    f(response);
  }); //getData()延迟执行后赋值给data
}
getA(c){
  return false;
}

class UserAgentClient extends http.BaseClient{
  final String userAgent;
  final http.Client _inner;
  UserAgentClient(this.userAgent, this._inner);
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _inner.send(request);
  }

}
