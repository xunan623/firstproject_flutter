import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.grey[100],
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('http://t9.baidu.com/it/u=583874135,70653437&fm=79&app=86&f=JPEG?w=3607&h=2408'),
          alignment: Alignment.topCenter, // 上边距居中
          repeat: ImageRepeat.repeatY, // 图片Y轴重复
          fit: BoxFit.cover, // 填充
          colorFilter: ColorFilter.mode(
            
            Colors.indigoAccent[400].withOpacity(0.5),
            BlendMode.hardLight,
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // 主轴居中
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            // color: Color.fromRGBO(3, 54, 255, 1),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration( // 盒子装饰
              color: Color.fromRGBO(3, 54, 255, 1),
              // borderRadius: BorderRadius.circular(16), // 全部圆角
              // borderRadius: BorderRadius.only( // 单独设置圆角
              //   topLeft: Radius.circular(64.0),
              //   bottomLeft: Radius.circular(64.0),
              // ), 
              shape: BoxShape.circle, // 圆形盒子
              gradient: LinearGradient( // 镜像渐变
                colors: [
                  Color.fromRGBO(7, 102, 255, 1),
                  Color.fromRGBO(3, 28, 128, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),

              // gradient: RadialGradient( // 镜像渐变
              //   colors: [
              //     Color.fromRGBO(7, 102, 255, 1),
              //     Color.fromRGBO(3, 28, 128, 1),
              //   ]
              // ),
              boxShadow: [ // 阴影
                BoxShadow(
                  offset: Offset(0, 16), // 偏移量
                  color: Color.fromRGBO(16, 20, 188, 1), // 颜色 默认黑色
                  blurRadius: 25, // 阴影圆角
                  spreadRadius: -9, // 扩散阴影
                )
              ], // 阴影
              border: Border.all( // 边框
                  color: Colors.indigoAccent[100],
                  width: 3.0,
                  style: BorderStyle.solid,

                // top: BorderSide(
                //   color: Colors.indigoAccent[100],
                //   width: 3.0,
                //   style: BorderStyle.solid,
                // ),
                // bottom: BorderSide(
                //   color: Colors.indigoAccent[100],
                //   width: 3.0,
                //   style: BorderStyle.solid,
                // )
              )
            ),
          )
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(
        text: '您好',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        children: [
          TextSpan(
            text: '.net',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.grey
            )
          )
        ]
      ),
    );
  }
}

class TextDemo extends StatelessWidget {

  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );

  final String _author = '李白';
  final String _title = '将进酒';

  @override
  Widget build(BuildContext context) {


    return Text(
      '$_title -- $_author 不多吹，我决定蹭蹭热点，录录视频，把作者完整写代码的过程加进去，并且接着这篇文章写，所以请看完上面的文章后再食用，我做了一些扩展如下计算hash耗时的问题，不仅可以通过web-workder，还可以参考React的FFiber架构，通过requestIdleCallback来利用浏览器的空闲时间计算，也不会卡死主线程文件hash的计算，是为了判断文件是否存在，进而实现秒传的功能，所以我们可以参考布隆过滤器的理念, 牺牲一点点的识别率来换取时间，比如我们可以抽样算hash文中通过web-workder让hash计算不卡顿主线程，但是大文件由于切片过多，过多的HTTP链接过去，也会把浏览器打挂 (我试了4个G的，直接卡死了)， 我们可以通过控制异步请求的并发数来解决，我记得这也是头条的一个面试题每个切片的上传进度不需要用表格来显示，我们换成方块进度条更直管一些(如图)并发上传中，报错如何重试，比如每个切片我们允许重试两次，三次再终止由于文件大小不一，我们每个切片的大小设置成固定的也有点略显笨拙，我们可以参考TCP协议的慢启动策略， 设置一个初始大小，根据上传任务完成的时候，来动态调整下一个切片的大小， 确保文件切片的大小和当前网速匹配小的体验优化，比如上传的时候文件碎片清理',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}