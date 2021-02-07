import 'package:flutter/material.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/models/record.dart';
import 'package:flutter_hackathon/pages/community/add_records_page.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
import 'package:flutter_hackathon/view-models/auth_view_model.dart';
import 'package:flutter_hackathon/view-models/record_view-model.dart';
import 'package:flutter_hackathon/widgets/common/card_widget.dart';
import 'package:provider/provider.dart';

class MyRecordsPage extends StatefulWidget {
  @override
  _MyRecordsPageState createState() => _MyRecordsPageState();
}

class _MyRecordsPageState extends State<MyRecordsPage> {
  @override
  Widget build(BuildContext context) {
    var rooter = locator<Rooter>();
    var scaffoldkey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(title: Text("Kayıtlarım"),),
      body: buildBody(context),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 50, right: 10),
        child: FloatingActionButton(
          onPressed: () async => await rooter.navigateToFullScreenDialog(ChangeNotifierProvider(
            create: (context) => RecordViewModel(),
              child: AddRecordsPage())).then((value){
                setState(() {});
                scaffoldkey.currentState.showSnackBar(SnackBar(content: Text("İlan ekleme başarılı")));
          }),
          child: Icon(Icons.add),
          tooltip: "Yeni kayıt ekle.",
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    var authViewModel = Provider.of<AuthViewModel>(context);
    var recordViewModel = Provider.of<RecordViewModel>(context);
    return FutureBuilder(
      future: recordViewModel.myRecordList(authViewModel.user.token),
      builder: (BuildContext context, AsyncSnapshot<List<Record>> snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }else{
          var myRecordList = snapshot.data;
        return ListView.builder(
        itemCount: myRecordList.length,
          itemBuilder: (context,index){
            if(myRecordList.length <= 0){
              return Center(child: Text("Henüz Kaydınız Bulunmamaktadır."),);
            }else{
              return CardWidget(
                title: myRecordList[index].title,
                body: myRecordList[index].body,
                recordsType: myRecordList[index].recordType,
                domainName: myRecordList[index].recordDomainName,
                status: myRecordList[index].status,
              );
            }

          },
        );
        }
      },
    );
  }
}
