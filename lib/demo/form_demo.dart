import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
        elevation: 0.0,

      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  void submitRegisterFrom () {

   if (registerFormKey.currentState.validate()) {
        registerFormKey.currentState.save();
      debugPrint('username: $username password: $password');

      Scaffold.of(context).showSnackBar( // 小Tip提示
        SnackBar(
          content: Text('Registering...'),
        )
      );
   } else {
      setState(() {
        autovalidate = true;
      });
   } 
  }

  String validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: '',
            ),
            onSaved: (value) {
              username = value;
            },
            validator: validateUsername,
            autovalidate: autovalidate, // 自动验证
          ),
          TextFormField(
            obscureText: true, // 密文
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '',
            ),
            onSaved: (value) {
              password = value;
            },
            validator: validatePassword,
            autovalidate: autovalidate, // 自动验证
          ),
          SizedBox(height: 32.0,),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white),),
              elevation: 0.0,
              onPressed: submitRegisterFrom,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() { // 销毁
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // textEditingController.text = 'hi'; // 文本框设置初始值
    textEditingController.addListener(
      () {
        debugPrint('input: ${textEditingController.text}');  
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // onChanged: (value) {
      //   debugPrint('input: $value');
      // },
      onSubmitted: (value) {
                debugPrint('submit: $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter the post title.', // 相当于placeHolder
        // border: InputBorder.none, // 去掉默认下划线
        // border: OutlineInputBorder(), // 四周带边框
        filled: true, // 灰色背景
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,

    );
  }
}