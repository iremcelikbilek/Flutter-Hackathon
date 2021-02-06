import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DistrictTabItem {Records, Approve}

class TabItemData {
  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);

  static Map<DistrictTabItem, TabItemData> allTabs = {
    DistrictTabItem.Records : TabItemData("Ana Sayfa", Icons.article),
    DistrictTabItem.Approve : TabItemData("Duyurular", Icons.check),
  };
}