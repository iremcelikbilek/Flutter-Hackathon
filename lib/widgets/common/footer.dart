import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  String buttonText;
  String infoText;
  VoidCallback onTap;

  Footer(
      {@required this.buttonText,
      @required this.infoText,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30),
      child: Container(
        alignment: Alignment.topRight,
        //color: Colors.red,
        height: 20,
        child: Row(
          children: <Widget>[
            Text(
              infoText,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: onTap,
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
