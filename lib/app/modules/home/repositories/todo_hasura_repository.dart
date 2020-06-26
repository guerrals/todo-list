import 'package:todo_mvc_mobX_Modular/app/modules/home/models/todo_model.dart';
import 'package:todo_mvc_mobX_Modular/app/modules/home/repositories/todo_repository_interface.dart';

class TodoHasuraRepository implements ITodoRepository {
  @override
  Future<void> delete(TodoModel model) {}

  @override
  Stream<List<TodoModel>> getTodoModels() {}

  @override
  Future<void> save(TodoModel model) {}
}
