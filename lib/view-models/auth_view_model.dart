import 'package:flutter/material.dart';
import 'package:flutter_hackathon/api/userServices.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/models/user.dart';

enum ViewState {Idle,Busy}

class AuthViewModel with ChangeNotifier{

  ViewState _viewState = ViewState.Idle;
  UserServices userServices = locator<UserServices>();
  User user = User();
  String errorTextMessage1, errorTextMessage2;
  
  ViewState get viewState => _viewState;

  set viewState(ViewState value) {
    _viewState = value;
    notifyListeners();
  }

  Future<User> signUp(Map body) async{
    viewState = ViewState.Busy;
    var map = await userServices.signUp(body);
    user.token = map["token"];
    user.userType = map["type"];
    viewState = ViewState.Idle;
    return user;
  }

  Future<User> signIn(String mail, String password) async{
    viewState = ViewState.Busy;
    Map<String, dynamic> map;
    try{
      Map<String, dynamic> map = await userServices.signIn(mail, password);
      user.token = map["token"];
      user.userType = map["type"];
    }catch(e){
      print("hata auth view model sign in $e");
      if(map == null){
        errorTextMessage1 = "Bilgileriniz yanlış";
        errorTextMessage2 = "Bilgileriniz yanlış";
      }
    }finally{
      viewState = ViewState.Idle;
    }

    return user;
  }


}