import 'package:flutter/material.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/pages/auth/register2.dart';
import 'package:flutter_hackathon/pages/login.page.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
import 'package:flutter_hackathon/widgets/common/buttons.dart';
import 'package:flutter_hackathon/widgets/common/footer.dart';
import 'package:flutter_hackathon/widgets/common/inputs.dart';
import 'package:flutter_hackathon/widgets/common/textContent.dart';
import 'package:flutter_hackathon/widgets/common/textVertical.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtLastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var rooter = locator<Rooter>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.purpleAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    TextVertical(verticalText: "Kaydol"),
                    TextContent(content: "Hesabın yoksa hesap oluşturmalısın."),
                  ],
                ),
<<<<<<< HEAD:lib/pages/auth/register.page.dart
                Input(txtController: txtName,labelText: "İsim",isObsure: false),
                Input(txtController: txtLastName,labelText: "Soy İsim",isObsure: false),
                Button(
                    buttonText: "İleri",
                    shadowColor: Colors.deepPurple[300],
                  onTap: () async => await rooter.navigateTo(Register2()),
                ),
                Footer(
                    buttonText: 'Giriş Yap',
                    infoText: 'Hesabın var mı?',
                  onTap: () async => await rooter.navigateTo(LoginPage()),
                ),
=======
                Input(
                    txtController: txtName, labelText: "İsim", isObsure: false),
                Input(
                    txtController: txtLastName,
                    labelText: "Soy İsim",
                    isObsure: false),
                Button(
                    buttonText: "İleri", shadowColor: Colors.deepPurple[300]),
                Footer(buttonText: 'Giriş Yap', infoText: 'Hesabın var mı?'),
>>>>>>> 1cf121e55a573915357b3bbe903378538e1412d7:lib/pages/register.page.dart
              ],
            ),
          ],
        ),
      ),
    );
  }
}
