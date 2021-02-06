import 'package:flutter/material.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/view-models/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'register.page.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
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
    var rooter = locator<Rooter>();

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
                  onTap: () {
                    var authViewModel = Provider.of<AuthViewModel>(context,listen: false);
                    authViewModel.signIn(txtMail.text, txtPassword.text);
                    if(authViewModel.token != null){
                      rooter.navigatePopUntil();
                    }
                  },
                ),
                Footer(
                  buttonText: "Kaydol",
                  infoText: 'Hesabın yok mu?',
                  onTap: () async {
                    await rooter.navigateTo(RegisterPage());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
