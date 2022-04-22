import 'package:ifood/shared/models/categorys.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/components/theme/app_images.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  List<Category> getCategorys() {
    return [
      Category(name: 'Açai', picture: AppImages.acai),
      Category(name: 'Brasileira', picture: AppImages.brasileira),
      Category(name: 'Café', picture: AppImages.cafe),
      Category(name: 'Doces', picture: AppImages.doces),
      Category(name: 'Japonêsa', picture: AppImages.japones),
      Category(name: 'Lanches', picture: AppImages.lanches),
      Category(name: 'Marmita', picture: AppImages.marmita),
      Category(name: 'Mercado', picture: AppImages.mercado),
      Category(name: 'Padaria', picture: AppImages.padaria),
      Category(name: 'Pizza', picture: AppImages.pizza),
      Category(name: 'Promoções', picture: AppImages.promocoes),
      Category(name: 'Saudável', picture: AppImages.saudavel),
      Category(name: 'Vegetariano', picture: AppImages.vegetariano),
      Category(name: 'Vale Refeição', picture: AppImages.vr),
    ];
  }

  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }
}

// class Repository<Category> {
//   List<Category> get() {
//     return [
//       Category(name: 'Açai', picture: AppImages.acai),
//       Category(name: 'Brasileira', picture: AppImages.brasileira),
//       Category(name: 'Café', picture: AppImages.cafe),
//       Category(name: 'Doces', picture: AppImages.doces),
//       Category(name: 'Japonêsa', picture: AppImages.japones),
//       Category(name: 'Lanches', picture: AppImages.lanches),
//       Category(name: 'Marmita', picture: AppImages.marmita),
//       Category(name: 'Mercado', picture: AppImages.mercado),
//       Category(name: 'Padaria', picture: AppImages.padaria),
//       Category(name: 'Pizza', picture: AppImages.pizza),
//       Category(name: 'Promoções', picture: AppImages.promocoes),
//       Category(name: 'Saudável', picture: AppImages.saudavel),
//       Category(name: 'Vegetariano', picture: AppImages.vegetariano),
//       Category(name: 'Vale Refeição', picture: AppImages.vr),
//     ];
//   }
// }
