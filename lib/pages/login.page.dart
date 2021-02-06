import 'package:flutter/material.dart';
import 'package:flutter_hackathon/widgets/loginWidgets/buttonLogin.dart';
import 'package:flutter_hackathon/widgets/loginWidgets/firstTime.dart';
import 'package:flutter_hackathon/widgets/loginWidgets/inputPassword.dart';
import 'package:flutter_hackathon/widgets/loginWidgets/inputUsername.dart';
import 'package:flutter_hackathon/widgets/loginWidgets/textLogin.dart';
import 'package:flutter_hackathon/widgets/loginWidgets/verticalTextLogin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightGreenAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalTextLogin(),
                  TextLogin(),
                ]),
                InputUsername(txtUsername),
                InputPassword(txtPassword),
                ButtonLogin(txtUsername, txtPassword),
                FirstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
