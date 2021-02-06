import 'package:flutter/material.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/pages/auth/register4.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
import 'package:flutter_hackathon/widgets/common/buttons.dart';
import 'package:flutter_hackathon/widgets/common/inputs.dart';
import 'package:flutter_hackathon/widgets/common/textContent.dart';
import 'package:flutter_hackathon/widgets/common/textVertical.dart';

class Register3 extends StatelessWidget {
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
                    TextContent(content: "Adım 3 : Şifre"),
                  ],
                ),
                Input(
                    txtController: txtName, labelText: "Şifre", isObsure: true),
                Input(
                  txtController: txtLastName,
                  labelText: "Şifre Tekrar",
                  isObsure: true,
                  textInputType: TextInputType.phone,
                ),
                Button(
                  buttonText: "İleri",
                  shadowColor: Colors.deepPurple[300],
                  onTap: () async => await rooter.navigateTo(Register4()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
