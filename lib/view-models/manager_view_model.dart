import 'package:flutter/material.dart';
import 'package:flutter_hackathon/api/dashboardServices.dart';
import 'package:flutter_hackathon/api/managerServices.dart';
import 'package:flutter_hackathon/locator.dart';

class ManagerViewModel with ChangeNotifier{
  ManagerServices _managerServices = locator<ManagerServices>();
  DashboardServices _dashboardServices = locator<DashboardServices>();


  Future<bool> answer(String token, int recordId, String answer, String status) async {
    try{
      await _managerServices.answer(token, recordId, answer, status);
      return true;
    }catch(e){
      return false;
    }
  }

  Future<List<int>> details(String token) async {
    List<int> statsList = await _dashboardServices.details(token);
    print("manager view model : $statsList");
    return statsList;
  }
}