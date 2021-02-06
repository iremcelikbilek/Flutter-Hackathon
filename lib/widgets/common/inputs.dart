import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  TextEditingController txtController;
  String labelText;
  bool isObsure;
  TextInputType textInputType;
  String errorText;

  Input(
      {this.txtController, this.labelText, this.isObsure, this.textInputType,this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          keyboardType: textInputType,
          controller: txtController,
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: isObsure,
          decoration: InputDecoration(
            errorText: errorText,
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
