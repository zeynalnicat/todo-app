
class TodoModel {


  TodoModel({required this.title,required this.description, this.isChecked = false});

  final String title;
  final String description;
  bool isChecked ;
  static List<TodoModel> _todos = [];

  static void addToDo(TodoModel todo){
    _todos.add(todo);
  }

  static List<TodoModel> getTodos(){
    return _todos;
  }

  static void toggleCheck(String name,bool val){
    final index = _todos.indexWhere((todo) => todo.title == name );
    _todos[index].isChecked = val;
  }


}