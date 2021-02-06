import 'package:flutter/cupertino.dart';
import 'package:flutter_hackathon/pages/community/navigation-bar/tab_items.dart';

class MyNavigationBar extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> pageBuilder;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

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
          _createNavbarItem(TabItem.Home),
          _createNavbarItem(TabItem.Notification),
          _createNavbarItem(TabItem.MyRecords),
        ],
        onTap: (index) => onSelectedTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final tabToBeCreated = TabItem.values[index];

        return CupertinoTabView(
          navigatorKey: navigatorKeys[tabToBeCreated],
          builder: (context) {
            return pageBuilder[tabToBeCreated];
          },
        );
      },
    );
  }

  BottomNavigationBarItem _createNavbarItem(TabItem tabItem) {
    final createTab = TabItemData.allTabs[tabItem];

    return BottomNavigationBarItem(
      icon: Icon(createTab.icon),
      label: createTab.title,
    );
  }
}