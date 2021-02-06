import 'package:flutter/material.dart';
import 'package:flutter_hackathon/widgets/common/buttons.dart';
import 'package:flutter_hackathon/widgets/common/inputs.dart';
import 'package:flutter_hackathon/widgets/common/textContent.dart';
import 'package:flutter_hackathon/widgets/common/textVertical.dart';

class Register4 extends StatelessWidget {
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtLastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    TextContent(content: "Adım 4 : Konum Bilgisi"),
                  ],
                ),
                Input(
                    txtController: txtName,
                    labelText: "Konum Bilgisi",
                    isObsure: false),
                Container(
                  height: 50,
                  width: 50,
                  child: Text("Map"),
                ),
                Button(
                  buttonText: "Kaydol",
                  shadowColor: Colors.deepPurple[300],
                  onTap: () {}, // Ana sayfaya aktarma
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
