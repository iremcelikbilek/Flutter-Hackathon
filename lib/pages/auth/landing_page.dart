import 'package:flutter/material.dart';
import 'package:flutter_hackathon/pages/auth/login.page.dart';
import 'package:flutter_hackathon/pages/community/community_main_page.dart';
import 'package:flutter_hackathon/pages/district-manager/district_manager_main_page.dart';
import 'package:flutter_hackathon/pages/province-manager/province_manager_main_page.dart';
import 'package:flutter_hackathon/view-models/auth_view_model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<AuthViewModel>(context);

    if(_authViewModel.viewState == ViewState.Idle){
      if(_authViewModel.user.token == null || _authViewModel.errorTextMessage1 != null){
        return LoginPage();
      }else if(_authViewModel.user.userType == "USER"){
        return CommunityMainPage();

      }else if(_authViewModel.user.userType == "districtManager"){
        return DistrictManagerMainPage();

      }else if(_authViewModel.user.userType == "provinceManager"){
        return ProvinceManagerMainPage();
      }else{
        return CommunityMainPage();
      }

    }else{
      return Scaffold(
        appBar: AppBar(title: Text("Lütfen Bekleyin"),),
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}


