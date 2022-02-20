import 'package:ifood/app/modules/welcome/welcome_page.dart';
import 'package:ifood/app/modules/welcome/welcome_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => WelcomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const WelcomePage()),
  ];
}
