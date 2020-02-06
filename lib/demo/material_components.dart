import 'package:firstproject/demo/slider_demo.dart';
import 'package:flutter/material.dart';
import './button_demo.dart';
import './floating_action_button.dart';
import './popup_menu_button_demo.dart';
import './form_demo.dart';
import './check_demo.dart';
import './radio_demo.dart';
import './switch_demo.dart';
import './slider_demo.dart';
import './datetime_demo.dart';

class MaterialComponments extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: 'CheckBox',
            page: CheckBoxDemo(),
          ),
          ListItem(
            title: 'RadioDemo',
            page: RadioDemo(),
          ),
          ListItem(
            title: 'SwitchDemo',
            page: SwitchDemo(),
          ),
          ListItem(
            title: 'SliderDemo',
            page: SliderDemo(),
          ),
          ListItem(
            title: 'DateTimeDemo',
            page: DateTimeDemo(),
          ),
          ListItem(
            title: 'Form',
            page: FormDemo(),
          ),
          ListItem(
            title: 'Button',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'PopupMenuButton',
            page: PopuMenuButtonDemo(),
          ),
          ListItem(
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
        ],
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 子部件垂直居中
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Button'),
                  onPressed: null,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
