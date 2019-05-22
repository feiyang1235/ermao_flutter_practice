import 'dart:io';

void main() async {
//  executeStepOne();
//  executeStepTwo();
//  executeStepThree('main()');
//  executeStepFour();
  f().then((s) => print(s));
  print("end!");
}

executeStepFour() {
  print("Four Executed!");
}

f() async {
  print("f() start");
//  String en = await executeStepThree("f()");
  print("start!");
  return "ss";
}

executeStepThree(String s) async {
  print("$s to Three Executed!");
  return "Step Three Return Value";
}

executeStepTwo() async {
  var c = await executeStepThree('StepTwo');
  print("Two Executed! $c");
}

void executeStepOne() {
  print("One Executed!");
}
