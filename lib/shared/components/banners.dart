import 'package:flutter/material.dart';
import 'package:ifood/shared/components/theme/app_colors.dart';

class BannersComponents extends StatefulWidget {
  final List<BannerItemComponents> list;
  const BannersComponents({Key? key, required this.list}) : super(key: key);

  @override
  State<BannersComponents> createState() => _BannersComponentsState();
}

class _BannersComponentsState extends State<BannersComponents> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener((_onChangePage));
  }

  _onChangePage() {
    setState(() {
      _currentIndex = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    _pageController.removeListener((_onChangePage));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 110,
            child: PageView(
              controller: _pageController,
              children: widget.list,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.list
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.5),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.list.indexOf(e) == _currentIndex
                                  ? AppColors.grey7
                                  : AppColors.grey,
                              shape: BoxShape.circle,
                            ),
                            height: 6,
                            width: 6,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class BannerItemComponents extends StatelessWidget {
  final String imagePath;
  const BannerItemComponents({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
