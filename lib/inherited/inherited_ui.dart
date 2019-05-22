import 'package:flutter/material.dart';
import 'inherited_model.dart';
import 'inherited_widget.dart';
class TestWidgetA extends StatelessWidget{
@override
  Widget build(BuildContext context) {
 InheritedTestModel inheritedTestModel =  InheritedContext.of(context).inheritedTestModel;
 print('TestWidgetA 中count的值:  ${inheritedTestModel.count}');
    return Padding(
      padding: EdgeInsets.all(10),
      child: RaisedButton(onPressed:  InheritedContext.of(context).increment,
        child: Text('+',
        style: new TextStyle(fontSize: 20.0),
        ),
        color: Colors.lightBlue,
        textColor: Colors.white,
      ),
    );
  }
}

class TestWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final inheritedTestModel =  InheritedContext.of(context).inheritedTestModel;
    print('TestWidgetB 中count的值:  ${inheritedTestModel.count}');

    return  new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child:  new Text('当前count:${inheritedTestModel.count}',style: new TextStyle(fontSize: 20.0),),
    );
  }
}



class TestWidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final inheritedTestModel =  InheritedContext.of(context).inheritedTestModel;

    print('TestWidgetC 中count的值:  ${inheritedTestModel.count}');

    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
          color: Colors.lightBlue,
          textColor: Colors.white,
          child: new Text('-',style: TextStyle(fontSize: 20.0),),
          onPressed:  InheritedContext.of(context).reduce),
    );
  }
}



class InheritedWidgetTestContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InheritedWidgetTestContainerState();
  }
}

class _InheritedWidgetTestContainerState
    extends State<InheritedWidgetTestContainer> {
  InheritedTestModel inheritedTestModel;

  _initData() {
    inheritedTestModel = new InheritedTestModel(0);
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  _incrementCount() {
    setState(() {
      inheritedTestModel = new InheritedTestModel(inheritedTestModel.count + 1);
    });
  }

  _reduceCount() {
    setState(() {
      inheritedTestModel = new InheritedTestModel(inheritedTestModel.count - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new InheritedContext(
        inheritedTestModel: inheritedTestModel,
        increment: _incrementCount,
        reduce: _reduceCount,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('InheritedWidgetTest'),
          ),
          body: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new Text('InheritedWidget Example',
                  style:  Theme.of(context).textTheme.title,),
              ),
              new TestWidgetA(),
              new TestWidgetB(),
              new TestWidgetC(),
            ],
          ),
        ));
  }
}