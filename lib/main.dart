import 'package:flutter/material.dart';
import './demo/listview_demo.dart';
import './demo/hello_demo.dart';
import './demo/drawer_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';
import './demo/listview_demo.dart';
import './demo/basic_deom.dart';
import './demo/layout_demo.dart';
import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';

void main() => runApp(App());
class App extends StatelessWidget {
  @override 
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false, // 是否显示调试flutter右上角的默认图
       home: Home(),
      //  initialRoute: '/', 
       routes: {
        //  '/': (context) => NavigatorDemo(), // 报错
        '/about': (context) => Page(title: 'About'),
       },
       theme: ThemeData(
         primarySwatch: Colors.yellow, // 导航条背景色
         highlightColor: Color.fromRGBO(255, 255, 255, 0.5), // 主题高亮颜色
         splashColor: Colors.white70, // 点击按钮水波纹颜色
       )
     );
   }
}

class Home extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return DefaultTabController(
        length: 5,
        child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          //  leading: IconButton( // 自定义左侧按钮
          //    icon: Icon(Icons.menu),
          //    tooltip: 'Navigation',
          //    onPressed: () => debugPrint('Navigation button is pressed'),
          //  ),
           title: Text('flutter...'),
           actions: <Widget>[ 
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Navigation',
                onPressed: () => debugPrint('Navigation search is pressed'),
              ),
           ],
           elevation: 1.0,
           bottom: TabBar(
             unselectedLabelColor: Colors.black38, // 未选中的图标颜色
             indicatorColor: Colors.black54, // 下划线颜色
             indicatorSize: TabBarIndicatorSize.label, // 下划线长度
             indicatorWeight: 1.0, // 下划线粗细
             tabs: <Widget>[
               Tab(icon: Icon(Icons.local_florist)),
               Tab(icon: Icon(Icons.change_history)),
               Tab(icon: Icon(Icons.directions_bike)),
               Tab(icon: Icon(Icons.view_quilt)),
               Tab(icon: Icon(Icons.shuffle)),
             ],
           ),
         ),
        body: TabBarView(
           children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            ViewDemo(),
            SliverDemo(),
            //  Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
           ],
         ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
       )
      );
    }
}