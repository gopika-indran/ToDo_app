import 'package:flutter/material.dart';
import 'package:todo_app/customes/colors.dart';
import 'package:todo_app/itemwidgets/items.dart';
import 'package:todo_app/model/itemmodel.dart';

class Hometodo extends StatefulWidget {
  const Hometodo({super.key});

  @override
  State<Hometodo> createState() => _HometodoState();
}

class _HometodoState extends State<Hometodo> {
  final todoslist = TodoModel.todolist();
  List<TodoModel> _foundtodo = [];
  TextEditingController addcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _foundtodo = todoslist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cllightgrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          backgroundColor: cllightgrey,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: clblack,
                size: 30,
              ),
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    "https://cancerfocusni.org/wp-content/uploads/2019/11/girl.jpg"),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (value) => searchbar(value),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: clwhitegrey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: clgrey,
                      ),
                      hintText: "Search"),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  const Text(
                    "All ToDos",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  for (TodoModel todoModel in _foundtodo)
                    todoitems(
                      todo: todoModel,
                      forchange: handlechanges,
                      fordelete: handledelete,
                    ),
                ],
              ))
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: TextField(
                    controller: addcontroller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: clwhitegrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Add a new todo item"),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(clblue)),
                      onPressed: () {
                        additems(addcontroller.text);
                      },
                      child: const Text(
                        "+",
                        style: TextStyle(fontSize: 40),
                      )),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  void searchbar(String enteringitems) {
    List<TodoModel> result = [];
    if (enteringitems.isEmpty) {
      result = todoslist;
    } else {
      result = todoslist
          .where((item) => item.todotext!
              .toLowerCase()
              .contains(enteringitems.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundtodo = result;
    });
  }

  void additems(String toDo) {
    setState(() {
      todoslist.add(TodoModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todotext: toDo));
    });
    addcontroller.clear();
  }

  void handledelete(String id) {
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }

  void handlechanges(TodoModel todo) {
    setState(() {
      if (todo.isDone != null) {
        todo.isDone = !todo.isDone!;
      }
    });
  }
}
