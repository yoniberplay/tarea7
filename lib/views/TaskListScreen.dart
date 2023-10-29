import 'package:flutter/material.dart';
import 'package:tarea7/DatabaseHelper.dart';
import 'package:tarea7/Tareas.dart';
import 'package:uuid/uuid.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Tareas> tasks = [];
  TextEditingController taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  _loadTasks() async {
    List<Tareas> getAlltasks = [];
    getAlltasks = await DB.tareas();
    print(getAlltasks.length);
    setState(() {
      tasks = getAlltasks;
    });
  }

  _addTask() async {
    String taskTitle = taskController.text;
    if (taskTitle.isNotEmpty) {
      DB.insert(Tareas(title: taskController.text, isCompleted: false));
      taskController.clear();
      _loadTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                Tareas task = tasks[index];
                return ListTile(
                  textColor: Colors.black,
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      setState(() {
                        task.isCompleted = value!;
                      });
                      DB.update(task);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: 'Add a task',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
