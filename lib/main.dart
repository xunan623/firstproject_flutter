import 'package:flutter/material.dart';
import './demo/listview_demo.dart';
import './demo/hello_demo.dart';

void main() => runApp(App());
class App extends StatelessWidget {
  @override 
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false, // 是否显示调试flutter右上角的默认图
       home: Home(),
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
        length: 3,
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
             ],
           ),
         ),
        body: TabBarView(
           children: <Widget>[
             Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
             Icon(Icons.change_history, size: 128.0, color: Colors.black12),
             Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
           ],
         ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('header'.toUpperCase()),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),
              ListTile(
                title: Text('Messages', textAlign: TextAlign.right),
                trailing: Icon(Icons.message, color: Colors.black12, size: 22.0,),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Favorite', textAlign: TextAlign.right),
                trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0,),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Setting', textAlign: TextAlign.right),
                trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0,), 
                onTap: () => Navigator.pop(context),
              ),

            ],
          ),
        ) // 左边抽屉drawer  右边抽屉endDrawer
       )
      );
    }
}