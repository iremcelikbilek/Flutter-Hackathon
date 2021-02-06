import 'package:flutter/material.dart';

class VerticalTextLogin extends StatefulWidget {
  @override
  _VerticalTextLoginState createState() => _VerticalTextLoginState();
}

class _VerticalTextLoginState extends State<VerticalTextLogin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 10),
      child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            'Giriş Yap',
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
