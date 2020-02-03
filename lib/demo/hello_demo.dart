import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
    @override 
   Widget build(BuildContext context) {
     return Center(
      child: Text(
        '狗哥',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
   }
}