import 'package:flutter/material.dart';


class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 0.0,
      backgroundColor: Colors.black87,
      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(30.0),
      // ), // 形状
    );

    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('add'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endDocked, // 按钮和工具栏叠合在一起
      bottomNavigationBar: BottomAppBar(
        // 底部工具栏
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(), // tabbar有个圆角
      ),
    );
  }
}
