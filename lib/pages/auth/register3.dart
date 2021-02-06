import 'package:flutter/material.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/models/user.dart';
import 'package:flutter_hackathon/pages/auth/register4.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
import 'package:flutter_hackathon/widgets/common/buttons.dart';
import 'package:flutter_hackathon/widgets/common/inputs.dart';
import 'package:flutter_hackathon/widgets/common/textContent.dart';
import 'package:flutter_hackathon/widgets/common/textVertical.dart';

class Register3 extends StatelessWidget {
  final TextEditingController txtPassword = TextEditingController();
  final TextEditingController txtPasswordAgain = TextEditingController();
  User user;
  Register3(this.user);

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
                    TextContent(content: "Adım 3 : Şifre"),
                  ],
                ),
                Input(
                    txtController: txtPassword, labelText: "Şifre", isObsure: true),
                Input(
                  txtController: txtPasswordAgain,
                  labelText: "Şifre Tekrar",
                  isObsure: true,
                  textInputType: TextInputType.phone,
                ),
                Button(
                  buttonText: "İleri",
                  shadowColor: Colors.deepPurple[300],
                  onTap: () async{
                    user.password = txtPassword.text;
                    await rooter.navigateTo(Register4(user));
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
