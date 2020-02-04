import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar( // 导航栏
            // title: Text('NingHao'),
            // pinned: true, // 有阴影的效果并且固定导航
            floating: true, // 滚动显示隐藏
            expandedHeight: 178.0, // 设置伸展的高度
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '您好 flutter'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                'http://t9.baidu.com/it/u=1307125826,3433407105&fm=79&app=86&f=JPEG?w=5760&h=3240',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(5.0),
              sliver: SliverListDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0), // 圆角
              elevation: 14.0, // 投影
              shadowColor: Colors.grey.withOpacity(0.5), // 阴影颜色
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    // 视图按比例显示
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // 开始位置
                      children: <Widget>[
                        Text(
                          posts[index].title,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                          ),
                        ),
                        Text(
                          posts[index].author,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0, // 网格自身比例
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
