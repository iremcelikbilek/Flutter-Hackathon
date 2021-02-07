import 'package:flutter/material.dart';
import 'package:flutter_hackathon/api/recordServices.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/models/record.dart';

class RecordViewModel with ChangeNotifier{
  RecordServices _recordServices = locator<RecordServices>();

  Future<bool> addRecord(Map body, String token) async {
    Map map = await _recordServices.addRecord(body, token);
    notifyListeners();
    if(map != null){
      return true;
    }else{
      return false;
    }
  }

  Future<List<Record>> myRecordList(String token) async {
    List<Map<String, dynamic>> mapRecord = await _recordServices.myRecordList(token);
    List<Record> myRecords = List<Record>();
    for(int i=0; i< mapRecord.length; i++)
    print("my record number : ${myRecords.length}");
    return myRecords;
  }

  Future<List<Record>> districtRecordList(String token) async {
    List<Map<String, dynamic>> mapDistrictRecord = await _recordServices.districtRecordList(token);
    List<Record> districtRecords = List<Record>();
    for(Map<String, dynamic> map in mapDistrictRecord){
      districtRecords.add(Record.fromJson(map));
    }
    return districtRecords;
  }

}