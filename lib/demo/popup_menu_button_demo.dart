import 'package:flutter/material.dart';

class PopuMenuButtonDemo extends StatefulWidget {
  _PopuMenuButtonDemoState createState() => _PopuMenuButtonDemoState();
}

class _PopuMenuButtonDemoState extends State<PopuMenuButtonDemo> {
  String _currentMenuItem = 'Home';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_currentMenuItem),
                PopupMenuButton(
                  onSelected: (value) {
                    print(value);
                    setState(() {
                      
                      _currentMenuItem = value;
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: 'Home',
                      child: Text('Home'),
                    ),
                                        PopupMenuItem(
                      value: 'Discover',
                      child: Text('Discover'),
                    ),
                    PopupMenuItem(
                      value: 'Community',
                      child: Text('Community'),
                    )

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
