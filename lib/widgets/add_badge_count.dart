import 'package:flutter/material.dart';
import 'package:flutter_sooda_app/constants/colors.dart';
import 'package:badges/badges.dart' as badges;

Widget addBadgeCount(
    {
    required Widget widget,
    required int badgeCount,
    Color badgeColor = AppColors.blueColor,
    badges.BadgeShape badgeShape = badges.BadgeShape.circle}) {
  return badges.Badge(
    showBadge: badgeCount != 0,
    badgeContent: Text(badgeCount.toString()),
    badgeStyle: badges.BadgeStyle(badgeColor: badgeColor, shape: badgeShape),
    child: widget,
  );
}
