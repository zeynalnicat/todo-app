import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/domain/models/todo_model.dart';
import 'package:todo_app/presentation/providers/todo_provider.dart';

class TodoContainer extends StatelessWidget {
  const TodoContainer({super.key, required this.activity});

  final TodoModel activity;
  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(activity.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
                SizedBox(height: 8,),
                Text(activity.description,style: TextStyle(color: Colors.grey),)
              ],
            ),
            Checkbox(value: activity.isChecked, onChanged: (val){
               Provider.of<TodoProvider>(context,listen: false).toggleCheck(activity.title, val ?? false);
            })
          ],
        ),
      ),
    );
  }
}
