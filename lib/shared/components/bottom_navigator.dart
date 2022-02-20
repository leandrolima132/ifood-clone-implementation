import 'package:flutter/material.dart';
import 'package:ifood/shared/components/theme/app_colors.dart';
import 'package:ifood/shared/components/theme/app_icons.dart';

class BottomNavigatorComponent extends StatelessWidget {
  final List<BottomNavigatorItem> items;
  final int currentIndex;

  const BottomNavigatorComponent({
    Key? key,
    this.currentIndex = 0,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(children: [
        Container(
          height: 1,
          color: AppColors.grey2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items,
          ),
        ),
      ]),
    );
  }
}

class BottomNavigatorItem extends StatelessWidget {
  final String label;
  final String activeIcon;
  final String icon;
  final bool isActive;

  const BottomNavigatorItem({
    Key? key,
    required this.label,
    required this.activeIcon,
    required this.icon,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            AppIcon(isActive ? activeIcon : icon),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
