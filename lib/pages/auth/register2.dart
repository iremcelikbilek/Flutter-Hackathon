import 'package:flutter/material.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/models/user.dart';
import 'package:flutter_hackathon/pages/auth/register3.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
import 'package:flutter_hackathon/widgets/common/buttons.dart';
import 'package:flutter_hackathon/widgets/common/inputs.dart';
import 'package:flutter_hackathon/widgets/common/textContent.dart';
import 'package:flutter_hackathon/widgets/common/textVertical.dart';

class Register2 extends StatelessWidget {
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPhone = TextEditingController();

  User user;
  Register2(this.user);

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
                    TextContent(content: "Adım 2 : İletişim Bilgileri"),
                  ],
                ),
                Input(
                    txtController: txtEmail,
                    labelText: "E-Posta",
                    isObsure: false),
                Input(
                  txtController: txtPhone,
                  labelText: "Telefon",
                  isObsure: false,
                  textInputType: TextInputType.phone,
                ),
                Button(
                  buttonText: "İleri",
                  shadowColor: Colors.deepPurple[300],
                  onTap: () {
                    user.mail = txtEmail.text;
                    user.phone = txtPhone.text;
                    rooter.navigateTo(Register3(user));
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
