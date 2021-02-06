import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon/pages/district-manager/navigation-bar/district_tab_items.dart';

class MyNavigationBar extends StatelessWidget {
  final DistrictTabItem currentTab;
  final ValueChanged<DistrictTabItem> onSelectedTab;
  final Map<DistrictTabItem, Widget> pageBuilder;
  final Map<DistrictTabItem, GlobalKey<NavigatorState>> navigatorKeys;

  const MyNavigationBar(
      {Key key,
        @required this.currentTab,
        @required this.onSelectedTab,
        @required this.pageBuilder,
        @required this.navigatorKeys})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: CupertinoColors.systemOrange,
        items: [
          _createNavbarItem(DistrictTabItem.Records),
          _createNavbarItem(DistrictTabItem.Approve),
        ],
        onTap: (index) => onSelectedTab(DistrictTabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final tabToBeCreated = DistrictTabItem.values[index];

        return CupertinoTabView(
          navigatorKey: navigatorKeys[tabToBeCreated],
          builder: (context) {
            return pageBuilder[tabToBeCreated];
          },
        );
      },
    );
  }

  BottomNavigationBarItem _createNavbarItem(DistrictTabItem tabItem) {
    final createTab = TabItemData.allTabs[tabItem];

    return BottomNavigationBarItem(
      icon: Icon(createTab.icon),
      label: createTab.title,
    );
  }
}