import 'package:mobx/mobx.dart';
import 'package:todo_mvc_mobX_Modular/app/modules/home/models/todo_model.dart';
import 'package:todo_mvc_mobX_Modular/app/modules/home/repositories/todo_repository_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITodoRepository repository;

  _HomeControllerBase(this.repository) {
    getList();
  }

  @observable
  ObservableStream<List<TodoModel>> todoList;

  @action
  getList() {
    todoList = repository.getTodoModels().asObservable();
  }

  Future<void> save(TodoModel model) => repository.save(model);

  Future<void> delete(TodoModel model) => repository.delete(model);
}
