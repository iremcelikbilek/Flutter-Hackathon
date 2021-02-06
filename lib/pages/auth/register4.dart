import 'package:flutter/material.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/models/user.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
import 'package:flutter_hackathon/view-models/auth_view_model.dart';
import 'package:flutter_hackathon/widgets/common/buttons.dart';
import 'package:flutter_hackathon/widgets/common/inputs.dart';
import 'package:flutter_hackathon/widgets/common/textContent.dart';
import 'package:flutter_hackathon/widgets/common/textVertical.dart';
import 'package:provider/provider.dart';

class Register4 extends StatelessWidget {
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtProvinceId = TextEditingController();

  User user;
  Register4(this.user);

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
                  onTap: () async{
                    var authViewModel = Provider.of<AuthViewModel>(context,listen: false);
                    user.districtID = "İzmir";
                    await authViewModel.signUp(user.toJsonRegister());
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
