import 'package:flutter/material.dart';
import 'package:flutter_hackathon/models/record.dart';
import 'package:flutter_hackathon/view-models/auth_view_model.dart';
import 'package:flutter_hackathon/view-models/record_view-model.dart';
import 'package:flutter_hackathon/widgets/common/card_widget.dart';
import 'package:flutter_hackathon/widgets/common/inputs.dart';
import 'package:provider/provider.dart';

class RecordsPage extends StatelessWidget {
  TextEditingController txtAnswer = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kayıtlar"),),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    var authViewModel = Provider.of<AuthViewModel>(context);
    var recordViewModel = Provider.of<RecordViewModel>(context);
    return FutureBuilder(
      future: recordViewModel.districtRecordList(authViewModel.user.token),
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
                  widget: Column(
                    children: [
                      Row(
                        children: [
                          Input(
                            txtController: txtAnswer,
                            labelText: "cevap giriniz",
                            isObsure: false,
                            textInputType: TextInputType.text,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          );
        }
      },
    );
  }
}
