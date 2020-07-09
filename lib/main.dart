import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show and hide password',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Show and hide password'),
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              PasswordInputFormField(),
              PasswordInputFormField(
                isPassword: true,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class PasswordInputFormField extends StatefulWidget {
  final bool isPassword;

  const PasswordInputFormField({this.isPassword = false});
  @override
  _PasswordInputFormFieldState createState() => _PasswordInputFormFieldState();
}

class _PasswordInputFormFieldState extends State<PasswordInputFormField> {
  bool showPass;
  @override
  initState() {
    showPass = !widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !showPass,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: showPass ? Theme.of(context).primaryColor : Colors.black54,
          ),
          onPressed: () {
            setState(() {
              showPass = !showPass;
            });
          },
        ),
      ),
    );
  }
}
