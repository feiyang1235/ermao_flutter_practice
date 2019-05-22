import 'package:flutter/material.dart';
import 'package:ninghao_flutter/inherited/inherited_ui.dart';
import 'animation/animation_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'page/listview_demo.dart';
import 'page/basic_demo.dart';
import 'page/layout_demo.dart';
import 'page/sliver_demo.dart';
import 'page/drawer_demo.dart';
import 'page/bottom_navigation_bar_demo.dart';
import 'http/http_demo.dart';
import 'page/navigator_demo.dart';

//src\rendering\binding.dart ->drawFrame()
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

//        locale: Locale('en', 'US'),
        //当前区域，如果为null则使用系统区域一般用于语言切换
        locale: Locale('zh', 'CN'),
        //本地化委托，用于更改Flutter Widget默认的提示语，按钮text等
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        //支持的语种
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
        ],
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
//         home: NavigatorDemo(),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/navigator': (context) => NavigatorDemo(),
          '/about': (context) => Page(title: 'About'),
          '/http': (context) => HttpDemo(),
          '/animation': (context) => AnimationDemo(),
          '/inherited': (context) => InheritedWidgetTestContainer(),
        },
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ));
  }
}

class Home extends StatelessWidget {
  //页面跳转动画
  static ScaleTransition createTransition(
      Animation<double> animation, Widget child) {
    return new ScaleTransition(
      scale: new Tween(begin: 0.0, end: 1.0).animate(animation),
      child: child,
    );
  }

  //页面跳转动画
  static ScaleTransition createTransition(
      Animation<double> animation, Widget child) {
    return new ScaleTransition(
      scale: new Tween(begin: 0.0, end: 1.0).animate(animation),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('ERMAO'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () => Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        AnimationDemo(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            createTransition(animation, child)))),
            IconButton(
                icon: Icon(Icons.label),
                tooltip: 'Search',
                onPressed: () => Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        AnimationDemo(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            createTransition(animation, child))))
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_quilt)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            // Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            BasicDemo(),
            // Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
            LayoutDemo(),
            SliverDemo(),
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
