import 'package:flutter/material.dart';
import 'inherited_model.dart';
class InheritedContext extends InheritedWidget{
  final InheritedTestModel inheritedTestModel;
  final Function() increment;
  final Function() reduce;
  InheritedContext({
    Key key,
    @required this.inheritedTestModel,
    @required this.increment,
    @required this.reduce,
    @required Widget child,
}):super(key:key,child:child);
  static InheritedContext of(BuildContext context){
    return context.inheritFromWidgetOfExactType(InheritedContext);
  }
  @override
  bool updateShouldNotify(InheritedContext oldWidget) {
    // TODO: implement updateShouldNotify
    return inheritedTestModel!=oldWidget.inheritedTestModel;
  }

}