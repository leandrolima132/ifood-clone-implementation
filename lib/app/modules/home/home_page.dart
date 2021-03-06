import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ifood/shared/components/banners.dart';
import 'package:ifood/shared/components/bottom_navigator.dart';
import 'package:ifood/shared/components/category_item.dart';
import 'package:ifood/shared/components/content_tab_bar.dart';
import 'package:ifood/shared/components/filters.dart';
import 'package:ifood/shared/components/theme/app_icons.dart';
import 'package:ifood/shared/components/theme/app_images.dart';
import 'package:ifood/shared/models/categorys.dart';
import 'package:ifood/shared/components/header_location.dart';

import '../../../app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  var controller = Modular.get<HomeController>();

  late List<Category> categories;

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    categories = controller.getCategorys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              const HeaderLocationComponent(
                  location: 'Rua Nossa Senhoras das Graças, 805'),
              ContentTabBarComponent(
                controller: tabController,
                onTap: (index) {},
              ),
              FiltersComponent()
            ];
          }),
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    return await Future.value();
                  },
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      _CategorySession(categories: categories),
                      _BannerSession()
                    ],
                  ),
                ),
              ),
              _BottomNavigation()
            ],
          ),
        ),
      ),
    );
  }
}

class _CategorySession extends StatelessWidget {
  final List<Category> categories;

  const _CategorySession({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 86,
        child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16 : 0,
                  right: index == categories.length - 1 ? 16 : 10,
                ),
                child: CategoryItemComponent(category: categories[index]),
              );
            }),
      ),
    );
  }
}

class _BannerSession extends StatelessWidget {
  const _BannerSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
          height: 180,
          child: BannersComponents(list: [
            BannerItemComponents(imagePath: AppImages.banner1),
            BannerItemComponents(imagePath: AppImages.banner2),
            BannerItemComponents(imagePath: AppImages.banner3),
            BannerItemComponents(imagePath: AppImages.banner4),
          ])),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigatorComponent(
      currentIndex: 0,
      items: [
        BottomNavigatorItem(
          label: 'Início',
          activeIcon: AppIcons.homeActive,
          icon: AppIcons.home,
          onTap: () {},
        ),
        BottomNavigatorItem(
          label: 'Busca',
          activeIcon: AppIcons.searchActive,
          icon: AppIcons.search,
          onTap: () {},
        ),
        BottomNavigatorItem(
          label: 'Pedidos',
          activeIcon: AppIcons.ordersActive,
          icon: AppIcons.orders,
          onTap: () {},
        ),
        BottomNavigatorItem(
          label: 'Perfil',
          activeIcon: AppIcons.profileActive,
          icon: AppIcons.profile,
          onTap: () {},
        ),
      ],
    );
  }
}
