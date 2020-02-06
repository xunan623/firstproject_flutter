import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 创建按钮
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Button'),
          onPressed: null,
          splashColor: Colors.grey, // 渐默的效果
          textColor: Theme.of(context).accentColor, // 文字颜色
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: null,
          splashColor: Colors.grey, // 渐默的效果
          textColor: Theme.of(context).accentColor, // 文字颜色
        ),
      ],
    );

    // 圆角按钮
    final Widget raisedButtonDeom = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                // 修改按钮的主题
                textTheme: ButtonTextTheme.primary,
                shape: StadiumBorder(),
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0)
                // )
              )),
          child: RaisedButton(
            child: Text('Button'),
            onPressed: () {},
            elevation: 0.0,
            // color: Theme.of(context).accentColor, // 主题颜色
            // textColor: Colors.white,
            // textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey, // 渐默的效果
          elevation: 12.0, // 阴影
          textColor: Theme.of(context).accentColor, // 文字颜色
        ),
      ],
    );

    // 带边框的圆角按钮
    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                // 修改按钮的主题
                textTheme: ButtonTextTheme.primary,
                shape: StadiumBorder(),
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0)
                // )
              )),
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
                // 描边颜色
                color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey, // 渐默的效果
          textColor: Theme.of(context).accentColor, // 文字颜色
        ),
      ],
    );

    // 填充按钮
    final Widget fixedWithButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 160.0,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
                // 描边颜色
                color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );

    // 扩展按钮
    final Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          // 填充整个宽度
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
                // 描边颜色
                color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2, // 按照比例显示
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
                // 描边颜色
                color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
      ],
    );

    final Widget buttonBarButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 32.0))),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                    // 描边颜色
                    color: Colors.black),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
              OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                    // 描边颜色
                    color: Colors.black),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
            ],
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 子部件垂直居中
          children: <Widget>[
            flatButtonDemo,
            raisedButtonDeom,
            outlineButtonDemo,
            fixedWithButton,
            expandedButton,
            buttonBarButton,
          ],
        ),
      ),
    );
  }
}
