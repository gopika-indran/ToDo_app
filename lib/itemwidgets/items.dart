import 'package:flutter/material.dart';
import 'package:todo_app/customes/colors.dart';
import 'package:todo_app/model/itemmodel.dart';

class todoitems extends StatelessWidget {
  final TodoModel todo;
  final forchange;
  final fordelete;
  const todoitems(
      {super.key,
      required this.todo,
      required this.forchange,
      required this.fordelete});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            forchange(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: clwhitegrey,
          leading: Icon(
            todo.isDone == true
                ? Icons.check_box
                : Icons.check_box_outline_blank,
            color: clblue,
          ),
          title: Text(
            todo.todotext!,
            style: TextStyle(
                color: clblack,
                decoration: todo.isDone == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          trailing: IconButton(
              onPressed: () {
                fordelete(todo.id);
              },
              icon: Icon(
                Icons.delete,
                color: clred,
              )),
        ));
  }
}
