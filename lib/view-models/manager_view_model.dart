import 'package:flutter/material.dart';
import 'package:flutter_hackathon/api/dashboardServices.dart';
import 'package:flutter_hackathon/api/managerServices.dart';
import 'package:flutter_hackathon/locator.dart';

class ManagerViewModel with ChangeNotifier{
  ManagerServices _managerServices = locator<ManagerServices>();
  DashboardServices _dashboardServices = locator<DashboardServices>();


  Future<Map> answer(String token, String recordId, String answer, String status) async {
    await _managerServices.answer(token, recordId, answer, status);
  }
}