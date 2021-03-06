import 'package:flutter/material.dart';

class Rooter {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<dynamic> navigateTo(Widget route) {
    return _navigatorKey.currentState
        .push(MaterialPageRoute(builder: (BuildContext context) => route));
  }

  Future<dynamic> navigateToFullScreenDialog(Widget route) {
    return _navigatorKey.currentState
        .push(MaterialPageRoute(fullscreenDialog: true, builder: (BuildContext context) => route));
  }


  Future<dynamic> navigateToReplace(Widget route) {
    return _navigatorKey.currentState.pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => route));
  }


  void navigatePopUntil() {
    return _navigatorKey.currentState.popUntil(ModalRoute.withName("/"));
  }
}
