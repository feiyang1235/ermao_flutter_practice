import 'dart:io';
import 'dart:isolate';

int i;

//main函数作为入口函数，它本身也是在一个isolate内部运行。
void main() {
  //Isolate的概念，利用 彼此隔离的堆内存，运行异步任务。 多个isolate之间可以相互通信。
  ReceivePort receiverPort = new ReceivePort(); //拿到了一个当前isolate的接收端口

  //创建一个另外的Isolate
  //创建，第一个参数是一个Function
  Isolate.spawn(entryPoint, receiverPort.sendPort);
  //这样就新创建了一个，并且把main这个的sendPort传给了它，让main可以传消息到新创建的isolate中,记为B

  receiverPort.listen((t) {//dart的一个isolate的运行过程，也是通过事件驱动的，通过事件队列(EVENT QUEUE)的循环，来响应各种变化。
    if (t is SendPort) {
      print("main给B发送消息 ，内容为：收到收到");
      t.send(
          "收到收到!"); //这里拿到了B的sendPort，给B发送一个回复的消息
    } else
      print("main接收到 B  发来的消息~~~~~" + t);
    if(t is String && t.startsWith("关闭!")){
      receiverPort.close();
    }
  });
//
//  sleep(Duration(seconds: 2)); //由于这里是单线程,所以main函数这个，要执行lis中的内容，也必须要等休眠结束
//  print("main睡眠结束"); //

}

//参数：sendPort 是main函数所在的传过来的sendPort，所以，当前这个可以用它来向main传信
void entryPoint(SendPort sendPort) {
  print("B 给main发送消息 ，内容为：我是B，我给main 发消息啦");
  sendPort.send("我是B，我给main 发消息啦"); //向main发送消息

  ReceivePort receiverPort = new ReceivePort();
  sendPort.send(receiverPort.sendPort); //实现双向通信，把B的sendPort给main

  receiverPort.listen((t) {
    print("B接收到 main 的消息~~~~~" + t);
    if(t is String){
      if(t.startsWith("收到收到")){
        sendPort.send("关闭!");
        receiverPort.close();
      }
    }
  });
}