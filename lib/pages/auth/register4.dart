import 'package:flutter/material.dart';
import 'package:flutter_hackathon/api/locationServices.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/models/user.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
import 'package:flutter_hackathon/view-models/auth_view_model.dart';
import 'package:flutter_hackathon/widgets/common/buttons.dart';
import 'package:flutter_hackathon/widgets/common/inputs.dart';
import 'package:flutter_hackathon/widgets/common/textContent.dart';
import 'package:flutter_hackathon/widgets/common/textVertical.dart';
import 'package:provider/provider.dart';

class Register4 extends StatefulWidget {
  User user;
  Register4(this.user);

  @override
  _Register4State createState() => _Register4State();
}

class _Register4State extends State<Register4> {
  final TextEditingController txtName = TextEditingController();
  LocationServices _locationServices = locator<LocationServices>();
  final TextEditingController txtProvinceId = TextEditingController();

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
                    TextContent(content: "Adım 4 : Konum Bilgisi"),
                  ],
                ),
                Button(
                  buttonText: "Kaydol",
                  shadowColor: Colors.deepPurple[300],
                  onTap: () async{
                    var authViewModel = Provider.of<AuthViewModel>(context,listen: false);
                    widget.user.districtID = 755;
                    await authViewModel.signUp(widget.user.toJsonRegister());
                    if(authViewModel.user.token != null){
                      rooter.navigatePopUntil();
                    }
                  }, // Ana sayfaya aktarma
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
