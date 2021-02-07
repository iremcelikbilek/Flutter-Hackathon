import 'package:flutter/material.dart';
import 'package:flutter_hackathon/api/recordServices.dart';
import 'package:flutter_hackathon/pages/district-manager/approve_page.dart';
import 'package:flutter_hackathon/pages/district-manager/navigation-bar/district_tab_items.dart';
import 'package:flutter_hackathon/pages/district-manager/navigation-bar/my_navigation_bar.dart';
import 'package:flutter_hackathon/pages/district-manager/records_page.dart';
import 'package:flutter_hackathon/view-models/record_view-model.dart';
import 'package:provider/provider.dart';

class DistrictManagerMainPage extends StatefulWidget {
  @override
  _DistrictManagerMainPageState createState() => _DistrictManagerMainPageState();
}

class _DistrictManagerMainPageState extends State<DistrictManagerMainPage> {
  DistrictTabItem _currentTab = DistrictTabItem.Records;

  Map<DistrictTabItem, Widget> allPages() {
    return {
      DistrictTabItem.Records:  ChangeNotifierProvider(
        create: (context) => RecordViewModel(),
        child: RecordsPage(),
      ),
      DistrictTabItem.Approve: ApprovePage(),
    };
  }

  Map<DistrictTabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    DistrictTabItem.Records: GlobalKey<NavigatorState>(),
    DistrictTabItem.Approve: GlobalKey<NavigatorState>(),
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
