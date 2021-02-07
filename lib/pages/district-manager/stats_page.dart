import 'package:flutter/material.dart';
import 'package:flutter_hackathon/view-models/auth_view_model.dart';
import 'package:flutter_hackathon/view-models/manager_view_model.dart';
import 'package:provider/provider.dart';

class StatsPage extends StatelessWidget {
  List<String> title = [
    "İstek Sayısı",
    "Şikayet Sayısı",
    "Altyapı Sorunları",
    "Ulaşım Sorunları",
    "Elektrik Sorunları",
    "Park ve Bahçe Sorunları",
    "Temizlik Sorunları",
    "Çözülen Sorunlar",
    "Reddedilen Sorunlar",
    "Ertelenen Sorunlar",
    "Bekleyen Sorunlar"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İstatistik"),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    var managerViewModel = Provider.of<ManagerViewModel>(context);
    var authViewModel = Provider.of<AuthViewModel>(context);

    return FutureBuilder(
        future: managerViewModel.details(authViewModel.user.token),
        builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return GridView.builder(
              itemCount: snapshot.data.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  var statsList = snapshot.data;
                  return Card(
                    color: Colors.green.withOpacity(0.3),
                    elevation: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          title[index],
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          statsList[index].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                        ),

                      ],
                    ),
                  );
                });

          }


        });
  }
}
