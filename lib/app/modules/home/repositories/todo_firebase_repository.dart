import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_mvc_mobX_Modular/app/modules/home/models/todo_model.dart';
import 'package:todo_mvc_mobX_Modular/app/modules/home/repositories/todo_repository_interface.dart';

class TodoFirebaseRepository implements ITodoRepository {
  final Firestore firestore;

  TodoFirebaseRepository(this.firestore);

  @override
  Stream<List<TodoModel>> getTodoModels() {
    return firestore
        .collection('todo')
        .orderBy('position')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.documents.map((doc) {
        return TodoModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future<void> save(TodoModel model) async {
    if (model.reference == null) {
      int total = (await Firestore.instance.collection('todo').getDocuments())
          .documents
          .length;
      model.reference = await Firestore.instance
          .collection('todo')
          .add({'title': model.title, 'check': model.check, 'position': total});
    } else {
      await model.reference
          .updateData({'title': model.title, 'check': model.check});
    }
  }

  @override
  Future<void> delete(TodoModel model) async => await model.reference.delete();
}
