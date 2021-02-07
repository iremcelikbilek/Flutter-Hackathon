import 'package:flutter/material.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/pages/community/add_records_page.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
import 'package:flutter_hackathon/view-models/record_view-model.dart';
import 'package:provider/provider.dart';

class MyRecordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rooter = locator<Rooter>();
    var scaffoldkey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(title: Text("Kayıtlarım"),),
      body: Center(child: Text("BENİM KAYITLARIMIN LİSTESİ"),),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 50, right: 10),
        child: FloatingActionButton(
          onPressed: () async => await rooter.navigateToFullScreenDialog(ChangeNotifierProvider(
            create: (context) => RecordViewModel(),
              child: AddRecordsPage())).then((value){
                scaffoldkey.currentState.showSnackBar(SnackBar(content: Text("İlan ekleme başarılı")));
          }),
          child: Icon(Icons.add),
          tooltip: "Yeni kayıt ekle.",
        ),
      ),
    );
  }
}
