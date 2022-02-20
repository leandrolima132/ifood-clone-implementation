import 'package:flutter/material.dart';
import 'package:ifood/shared/components/theme/app_colors.dart';
import 'package:ifood/shared/components/theme/app_typography.dart';
import '../components/theme/app_icons.dart';

class FiltersComponent extends StatelessWidget {
  final String? location;
  const FiltersComponent({this.location, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _FiltersComponent(),
      pinned: true,
    );
  }
}

class _FiltersComponent extends SliverPersistentHeaderDelegate {
  _FiltersComponent();
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      height: 54,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 16,
          ),
          FilterItemComponents(
            label: 'Ordenar',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponents(
            label: 'Pra retirar',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponents(
            label: 'Entrega grátis',
          ),
          FilterItemComponents(
            label: 'Vale-refeição',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponents(
            label: 'Distância',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponents(
            label: 'Entrega Parceira',
          ),
          FilterItemComponents(
            label: 'Super Restaurante',
          ),
          FilterItemComponents(
            label: 'Filtros',
            icon: AppIcons.arrowDown,
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 54;

  @override
  // TODO: implement minExtent
  double get minExtent => 54;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}

class FilterItemComponents extends StatelessWidget {
  final String label;
  final String? icon;
  const FilterItemComponents({
    Key? key,
    required this.label,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 14, right: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppColors.grey2),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(label,
                  style: AppTypography.filterItemStyle(context)
                      ?.copyWith(color: AppColors.grey7)),
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: AppIcon(
                    icon!,
                    size: Size(14, 14),
                    color: AppColors.grey7,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
