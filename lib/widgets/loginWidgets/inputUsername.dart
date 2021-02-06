import 'package:flutter/material.dart';

class InputUsername extends StatefulWidget {
  TextEditingController txtUsername;
  InputUsername(this.txtUsername);

  @override
  _InputUsernameState createState() => _InputUsernameState();
}

class _InputUsernameState extends State<InputUsername> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: widget.txtUsername,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightGreenAccent,
            labelText: 'Kullanıcı Adı',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
