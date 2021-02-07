import 'package:flutter/material.dart';
import 'package:flutter_hackathon/pages/community/all_records_page.dart';
import 'package:flutter_hackathon/pages/community/my_records_page.dart';
import 'package:flutter_hackathon/pages/community/navigation-bar/bottom_navigation_bar.dart';
import 'package:flutter_hackathon/pages/community/navigation-bar/tab_items.dart';
import 'package:flutter_hackathon/pages/community/notification_page.dart';
import 'package:flutter_hackathon/view-models/record_view-model.dart';
import 'package:provider/provider.dart';

class CommunityMainPage extends StatefulWidget {
  @override
  _CommunityMainPageState createState() => _CommunityMainPageState();
}

class _CommunityMainPageState extends State<CommunityMainPage> {
  TabItem _currentTab = TabItem.Home;
  Map<TabItem, Widget> allPages() {
    return {
      TabItem.Home:  ChangeNotifierProvider(
        create: (context) => RecordViewModel(),
        child: AllRecordsPage(),
      ),
      TabItem.Notification: NotificationPage(),
      TabItem.MyRecords : ChangeNotifierProvider(
        create: (context) => RecordViewModel(),
        child: MyRecordsPage(),
      ),
    };
  }

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.Home: GlobalKey<NavigatorState>(),
    TabItem.Notification: GlobalKey<NavigatorState>(),
    TabItem.MyRecords : GlobalKey<NavigatorState>(),
  };


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: MyNavigationBar(
        navigatorKeys: navigatorKeys,
        pageBuilder: allPages(),
        currentTab: _currentTab,
        onSelectedTab: (tabItem) {
          if(tabItem == _currentTab){
            navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
          }else{
            setState(() {
              _currentTab = tabItem;
            });
          }
          debugPrint("Seçilen Tab Item : $tabItem");
        },
      ),
    );
  }
}
