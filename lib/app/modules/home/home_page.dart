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
import '../../../app/modules/home/home_controller.dart';
import '../../../shared/components/header_location.dart';

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

  late List<Category> categorys;

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    categorys = controller.getCategorys();
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
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 86,
                          child: ListView.builder(
                              itemCount: categorys.length,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: index == 0 ? 16 : 0,
                                    right:
                                        index == categorys.length - 1 ? 16 : 10,
                                  ),
                                  child: CategoryItemComponent(
                                      category: categorys[index]),
                                );
                              }),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                            height: 180,
                            child: BannersComponents(list: [
                              BannerItemComponents(
                                  imagePath: AppImages.banner1),
                              BannerItemComponents(
                                  imagePath: AppImages.banner2),
                              BannerItemComponents(
                                  imagePath: AppImages.banner3),
                              BannerItemComponents(
                                  imagePath: AppImages.banner4),
                            ])),
                      ),
                    ],
                  ),
                ),
              ),
              BottomNavigatorComponent(
                currentIndex: 0,
                items: [
                  BottomNavigatorItem(
                    label: 'Início',
                    activeIcon: AppIcons.homeActive,
                    icon: AppIcons.home,
                  ),
                  BottomNavigatorItem(
                    label: 'Busca',
                    activeIcon: AppIcons.searchActive,
                    icon: AppIcons.search,
                  ),
                  BottomNavigatorItem(
                    label: 'Pedidos',
                    activeIcon: AppIcons.ordersActive,
                    icon: AppIcons.orders,
                  ),
                  BottomNavigatorItem(
                    label: 'Perfil',
                    activeIcon: AppIcons.profileActive,
                    icon: AppIcons.profile,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
