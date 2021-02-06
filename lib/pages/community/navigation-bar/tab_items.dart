import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem {Home,Notification,MyRecords}

class TabItemData {
  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);

  static Map<TabItem, TabItemData> allTabs = {
    TabItem.Home : TabItemData("Ana Sayfa", Icons.home_filled),
    TabItem.Notification : TabItemData("Duyurular", Icons.notifications),
    TabItem.MyRecords : TabItemData("Kayıtlarım", Icons.article),
  };
}