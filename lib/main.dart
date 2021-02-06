import 'package:flutter/material.dart';
import 'package:flutter_hackathon/locator.dart';
import 'package:flutter_hackathon/pages/auth/landing_page.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
import 'package:flutter_hackathon/view-models/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  setUpLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthViewModel() ,
      child: MaterialApp(
        navigatorKey: locator<Rooter>().navigatorKey,
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: LandingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
