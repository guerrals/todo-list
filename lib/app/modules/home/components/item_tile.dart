import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_mvc_mobX_Modular/app/modules/home/home_controller.dart';
import 'package:todo_mvc_mobX_Modular/app/modules/home/models/todo_model.dart';

class ItemTile extends StatelessWidget {
  final TodoModel model;
  final Function ontap;

  const ItemTile({Key key, this.model, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: IconButton(
        icon: Icon(
          Icons.remove_circle_outline,
          color: Colors.red,
        ),
        onPressed: () {
          Modular.get<HomeController>().delete(model);
        },
      ),
      title: Text(model.title),
      trailing: Checkbox(
        value: model.check,
        onChanged: (check) {
          model.check = check;
          Modular.get<HomeController>().save(model);
        },
      ),
    );
  }
}
