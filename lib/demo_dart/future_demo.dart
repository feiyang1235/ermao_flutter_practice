void main(){
  new Future(() => futureTask())  //  异步任务的函数
      .then((m) => "futueTask execute result:$m")  //   任务执行完后的子任务
      .then((m) => m.length)  //  其中m为上个任务执行完后的返回的结果
      .then((m) => printLength(m))
      .whenComplete(() => whenTaskCompelete);  //  当所有任务完成后的回调函数
//  futureTask1((a){
//    print("haha $a");
//  });
}

int futureTask() {
  return 21;
}
//int futureTask1(Function f(a)) {
//  f(21);
//  return 21;
//}

void printLength(int length) {
  print("Text Length:$length");
}

void whenTaskCompelete() {
  print("Task Complete");
}