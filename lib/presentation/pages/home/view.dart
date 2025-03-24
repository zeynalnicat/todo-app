import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_strings.dart';
import 'package:todo_app/domain/models/todo_model.dart';
import 'package:todo_app/presentation/pages/home/components/bottom_add_todo.dart';
import 'package:todo_app/presentation/pages/home/components/todo_container.dart';
import 'package:todo_app/presentation/providers/todo_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   final provider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.title),
        actions: [
          IconButton(onPressed: (){
            context.read<TodoProvider>().clear();
          }, icon:Icon(Icons.delete))

        ],
      ),
      body: provider.todos.isNotEmpty ? Column(
        children: [
           LinearProgressIndicator(
             value: provider.completionPercentage,
             valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),

           ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.todos.length,
                itemBuilder: (context,index){
                   return TodoContainer(activity: provider.todos[index]);
                },
              ),
            )
        ],
      ) : Center(
        child: Text(AppStrings.empty),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (_) => BottomAddTodo());
      },
      child: Icon(Icons.add)),
    );
  }
}
