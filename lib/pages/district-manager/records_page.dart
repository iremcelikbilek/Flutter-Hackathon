import 'package:flutter/material.dart';
import 'package:flutter_hackathon/models/record.dart';
import 'package:flutter_hackathon/view-models/auth_view_model.dart';
import 'package:flutter_hackathon/view-models/manager_view_model.dart';
import 'package:flutter_hackathon/view-models/record_view-model.dart';
import 'package:flutter_hackathon/widgets/common/card_widget.dart';
import 'package:flutter_hackathon/widgets/common/inputs.dart';
import 'package:provider/provider.dart';

class RecordsPage extends StatefulWidget {
  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  TextEditingController txtAnswer = TextEditingController();

  List<String> allStatus = ["resolved", "pending", "denied", "delayed"];

  String status;

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
    var managerViewModel = Provider.of<ManagerViewModel>(context);
    return FutureBuilder(
      future: recordViewModel.districtRecordList(authViewModel.user.token),
      builder: (BuildContext context, AsyncSnapshot<List<Record>> snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }else{
          var districtRecordList = snapshot.data;
          return ListView.builder(
            itemCount: districtRecordList.length,
            itemBuilder: (context,index){
              if(districtRecordList.length <= 0){
                return Center(child: Text("Henüz Kaydınız Bulunmamaktadır."),);
              }else{
                return CardWidget(
                  title: districtRecordList[index].title,
                  body: districtRecordList[index].body,
                  recordsType: districtRecordList[index].recordType,
                  domainName: districtRecordList[index].recordDomainName,
                  status: districtRecordList[index].status,
                  answerLayout: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: txtAnswer,
                              decoration:
                              InputDecoration(
                                  labelText: "Cevap :",
                                  hintText: "Cevap giriniz"),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.shade200,
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              //border: Border.all(color: Colors.black),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                items: allStatus.map((domainName){
                                  return DropdownMenuItem<String>(
                                    value: domainName,
                                    child: Text(domainName.toUpperCase(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 13),),
                                  );
                                }).toList(),
                                value: status,
                                onChanged: (changedDomain){
                                  setState(() {
                                    status = changedDomain;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.shade200,
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              //border: Border.all(color: Colors.black),
                            ),

                              child: FlatButton(onPressed: () async{
                                bool result = await managerViewModel.answer(authViewModel.user.token, districtRecordList[index].id, txtAnswer.text, status);
                                if(result){
                                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Cevaplama başarılı")));
                                  txtAnswer.clear();
                                  setState(() {});
                                }else{
                                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Bir hata oldu tekrar deneyin")));
                                }

                              }, child: Text("CEVAPLA",style: TextStyle(fontWeight: FontWeight.bold),),),),
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
