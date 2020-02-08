import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ['Apple', 'Banana', 'Lemon'];

  String _action = 'Nothing';

  List<String> _selected = [];

  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              // 换行控件
              spacing: 8.0, // 间隔
              runSpacing: 8.0, // 行与行之间的间隔
              children: <Widget>[
                Chip(
                  label: Text('Life..........'),
                ),
                Chip(
                  label: Text('Sunet 狗子变了'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('您好'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('许'),
                  ),
                ),
                Chip(
                  label: Text('为什么'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'http://img3.imgtn.bdimg.com/it/u=378824344,1185609431&fm=26&gp=0.jpg',
                    ),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent, // 给图标设置颜色
                  deleteButtonTooltipMessage: 'Remove this tag',
                  onDeleted: () {},
                ),
                Divider(
                  // 分割线
                  color: Colors.grey,
                  height: 32.0,
                  indent: 32.0, // 缩进
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  // 分割线
                  color: Colors.grey,
                  height: 32.0,
                  indent: 32.0, // 缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  // 分割线
                  color: Colors.grey,
                  height: 32.0,
                  indent: 32.0, // 缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip: ${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  // 分割线
                  color: Colors.grey,
                  height: 32.0,
                  indent: 32.0, // 缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip: $_choice'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selectedColor: Colors.black,
                      selected: _choice == tag,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = ['Apple', 'Banana', 'Lemon'];
            _selected = [];
            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}
