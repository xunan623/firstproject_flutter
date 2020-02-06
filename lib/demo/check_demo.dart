import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkboxItemA = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              value: _checkboxItemA,
              onChanged: (value) {
                setState(() {
                  _checkboxItemA = value;
                });
              },
              title: Text('Checkbox Item A'), // 主标题
              subtitle: Text('Description'),  // 副标题
              secondary: Icon(Icons.bookmark), // 图标
              selected: _checkboxItemA, // 当前是否选中
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Checkbox(
                //   value: _checkboxItemA,
                //   onChanged: (value) {
                //     setState(() {
                //       _checkboxItemA = value;
                //     });
                //   },
                //   activeColor: Colors.black,
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
