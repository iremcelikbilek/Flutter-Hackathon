import 'package:flutter/material.dart';
import 'package:flutter_hackathon/api/userServices.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/models/user.dart';

enum ViewState {Idle,Busy}

class AuthViewModel with ChangeNotifier{

  ViewState _viewState = ViewState.Idle;
  UserServices userServices = locator<UserServices>();
  User user = User();

  ViewState get viewState => _viewState;

  set viewState(ViewState value) {
    _viewState = value;
    notifyListeners();
  }

  Future<User> signUp(Map body) async{
    viewState = ViewState.Busy;
    var map = await userServices.signUp(body);
    print("user view model1 ${map["token"]}");
    user.token = map["token"];
    print("user view model ${user.token}");
    user.userType = map["user"]["type"];
    viewState = ViewState.Idle;
    return user;
  }

  Future<User> signIn(String mail, String password) async{
    viewState = ViewState.Busy;
    Map<String, dynamic> map = await userServices.signIn(mail, password);
    print("user view model1 ${map["token"]}");
    user.token = map["token"];
    print("user view model ${user.token}");
    user.userType = map["user"]["type"];
    viewState = ViewState.Idle;
    return user;
  }

}