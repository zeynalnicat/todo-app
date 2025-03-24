
import 'package:flutter/cupertino.dart';
import 'package:todo_app/domain/models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;

  int get completion => _todos.where((todo) => todo.isChecked == true).length;
  double get completionPercentage => _todos.isEmpty ? 0 : (completion / _todos.length);



  void addToDo(TodoModel todo){
    _todos.add(todo);
    notifyListeners();
  }

  void toggleCheck(String name,bool val){
    final index = _todos.indexWhere((todo) => todo.title == name );
    _todos[index].isChecked = val;
    notifyListeners();
  }

  void clear(){
    _todos.clear();
    notifyListeners();
  }

}