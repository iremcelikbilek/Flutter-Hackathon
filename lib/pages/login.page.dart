import 'package:flutter/material.dart';
import 'package:flutter_hackathon/widgets/common/buttons.dart';
import 'package:flutter_hackathon/widgets/common/footer.dart';
import 'package:flutter_hackathon/widgets/common/inputs.dart';
import 'package:flutter_hackathon/widgets/common/textContent.dart';
import 'package:flutter_hackathon/widgets/common/textVertical.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController txtMail = TextEditingController();
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
                  TextVertical(verticalText: "Giriş Yap"),
                  TextContent(
                      content: "Hesabını oluşturduysan hızlıca giriş yap."),
                ]),
                Input(
                    txtController: txtMail,
                    labelText: "Kullanıcı E-Posta",
                    isObsure: false),
                Input(
                    txtController: txtPassword,
                    labelText: "Şifre",
                    isObsure: true),
                Button(
                  buttonText: "Giriş",
                  shadowColor: Colors.green[300],
                ),
                Footer(buttonText: "Kaydol", infoText: 'Hesabın yok mu?')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
