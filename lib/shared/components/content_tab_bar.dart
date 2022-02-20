import 'package:flutter/material.dart';
import 'package:ifood/shared/components/theme/app_colors.dart';
import 'package:ifood/shared/components/theme/app_typography.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ContentTabBarComponent extends StatelessWidget {
  final TabController controller;
  final Function(int) onTap;
  const ContentTabBarComponent(
      {Key? key, required this.onTap, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        delegate: _ContentTabBarComponentDelegate(controller, onTap));
  }
}

class _ContentTabBarComponentDelegate extends SliverPersistentHeaderDelegate {
  final TabController controller;
  final Function(int) onTap;

  _ContentTabBarComponentDelegate(this.controller, this.onTap);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 16, right: (width / 10) - 5),
      child: TabBar(
          labelPadding: EdgeInsets.only(left: 5, right: 5),
          indicatorPadding: EdgeInsets.zero,
          labelColor: AppColors.primaryColor,
          labelStyle: AppTypography.tabBarStyle(context),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          unselectedLabelColor: AppColors.black54,
          indicator: MaterialIndicator(
            color: AppColors.primaryColor,
            height: 2,
            bottomLeftRadius: 5,
            bottomRightRadius: 5,
          ),
          isScrollable: true,
          onTap: onTap,
          controller: controller,
          tabs: const <Widget>[
            Tab(
              child: Text('Restaurantes'),
            ),
            Tab(
                child: Text(
              'Mercados',
            )),
            Tab(
                child: Text(
              'Bebidas',
            )),
            Tab(
                child: Text(
              'Farmácias',
            )),
            Tab(
                child: Text(
              'Pets',
            )),
            Tab(
                child: Text(
              'Express',
            )),
          ]),
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
