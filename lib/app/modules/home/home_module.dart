import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_mvc_mobX_Modular/app/modules/home/repositories/todo_firebase_repository.dart';
import 'package:todo_mvc_mobX_Modular/app/modules/home/repositories/todo_repository_interface.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind<ITodoRepository>(
            (i) => TodoFirebaseRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
