import 'package:flutter/material.dart';
import '../components/theme/app_colors.dart';
import '../components/theme/app_icons.dart';
import '../components/theme/app_typography.dart';

class HeaderLocationComponent extends StatelessWidget {
  final String location;
  const HeaderLocationComponent({required this.location, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        delegate: _HeaderLocationComponentDelegate(location));
  }
}

class _HeaderLocationComponentDelegate extends SliverPersistentHeaderDelegate {
  final String location;

  _HeaderLocationComponentDelegate(this.location);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      location,
                      style: AppTypography.localTextStyle(context),
                    ),
                    const AppIcon(AppIcons.arrowDown,
                        size: Size(20, 20), color: AppColors.primaryColor),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 38;

  @override
  // TODO: implement minExtent
  double get minExtent => 38;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
