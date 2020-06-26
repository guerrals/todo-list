import 'package:todo_mvc_mobX_Modular/app/modules/home/models/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<TodoModel>> getTodoModels();

  Future<void> save(TodoModel model);

  Future<void> delete(TodoModel model);
}
