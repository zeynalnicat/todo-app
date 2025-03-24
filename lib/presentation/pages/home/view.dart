import 'package:flutter/material.dart';
import 'package:todo_app/common/app_strings.dart';
import 'package:todo_app/domain/models/todo_model.dart';
import 'package:todo_app/presentation/pages/home/components/bottom_add_todo.dart';
import 'package:todo_app/presentation/pages/home/components/todo_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  late List<TodoModel> todos;

  @override
  void initState() {
    super.initState();
    todos = TodoModel.getTodos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.title),
      ),
      body: Column(
        children: [
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context,index){
                   return TodoContainer(activity: todos[index]);
                },
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (_) => BottomAddTodo());
        setState(() {
          todos = TodoModel.getTodos();
        });
      },
      child: Icon(Icons.add)),
    );
  }
}
