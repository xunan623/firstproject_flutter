import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Text('header'.toUpperCase()),
          //   decoration: BoxDecoration(
          //   color: Colors.grey[100],
          //   ),
          // ),
          UserAccountsDrawerHeader(
            accountName:
                Text('许楠', style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text(
              'xunan623@163.com',
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://data.photo-ac.com/data/thumbnails/a2/a27b53ac1101d3f4a6da645ed2019707_w.jpeg'),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                    image: NetworkImage(
                        'https://data.ac-illust.com/data/thumbnails/a6/a638af5f3583b81fb594af8471665cc5_w.jpeg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.yellow[400].withOpacity(0.5),
                        BlendMode.hardLight))),
          ),
          ListTile(
            title: Text('Messages', textAlign: TextAlign.right),
            trailing: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right),
            trailing: Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Setting', textAlign: TextAlign.right),
            trailing: Icon(
              Icons.settings,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    ); // 左边抽屉drawer  右边抽屉endDrawer
  }
}
