import 'dart:async'as async;

void main(){
 var _data = "hello flutter";
  new Future(() => futureTask())
      .then((m) => "futueTask execute result:$m")
      .then((m) => printString(m))
      .whenComplete(() => whenTaskCompelete); //加入Event Queue中


  //加入MicroTask Queue中
  new Future.microtask(() => microTask())
      .then((m) => "microTask execute result:$m")
//      .then((m) => m.length)
      .then((m) => printString(m))
      .whenComplete(() => whenTaskCompelete);//方式1.使用Future的命名构造函数

  async.scheduleMicrotask(() => microTask2());//方式2
  executeFunc(_data);//未放入队列的方法
 fun2(_data);

}

void executeFunc(String data) {
  print("main: $data");
}
int futureTask() {
  return 21;
}

int microTask() {
  return 21;
}
void microTask2(){
  //  doing something
  print("single microtask!!");
}

void printLength(int length) {
  print("Text Length:$length");
}
void printString(String str) {
  print("Text :$str");
}
void whenTaskCompelete() {
  print("Task Complete");
}

fun1(String data) async{
  return "factory: $data";
}

fun2(String data) async{
String factoryData  = await fun1(data);
print(factoryData);
}