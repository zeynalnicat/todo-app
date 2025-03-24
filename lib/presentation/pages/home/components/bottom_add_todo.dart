import 'package:flutter/material.dart';
import 'package:todo_app/common/app_strings.dart';
import 'package:todo_app/domain/models/todo_model.dart';

class BottomAddTodo extends StatelessWidget {
  const BottomAddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
           TextField(
             controller: titleController,
             decoration: InputDecoration(
               hintText: AppStrings.todoName,
               label: Text(AppStrings.labelName),
             ),
           ),
          SizedBox(height: 8,),
          TextField(
            controller: descController,
            decoration: InputDecoration(
                hintText: AppStrings.todoDescription,
                label: Text(AppStrings.labelDescription)
            ),
          ),
          SizedBox(height: 16,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              TodoModel.addToDo(TodoModel(title: titleController.text, description: descController.text));
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child:  Text(AppStrings.add),),
          )
        ],
      ),
    );
  }
}
