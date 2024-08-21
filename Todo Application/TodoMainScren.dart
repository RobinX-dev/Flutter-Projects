import 'package:flutter/material.dart';
import 'package:todo_application/DataModel.dart';

final TextEditingController _titleController = TextEditingController();
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {

  List<DataModel> todoList = [
    DataModel(title: 'Shopping', time: DateTime.now()),
    DataModel(title: 'Outing', time: DateTime.now()),
    DataModel(title: 'Movie', time: DateTime.now()),
    DataModel(title: 'Study', time: DateTime.now()),
  ];

  void showBottomScreen(){
    showModalBottomSheet(context: context, builder: ((context) =>
      Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          OutlinedButton(
            onPressed: (){
              if(_titleController.text.isEmpty){
                return;
              }
              DataModel newItem = DataModel(title: _titleController.text, time: DateTime.now());
              setState(() {
                todoList.add(newItem);
                _titleController.clear();
                Navigator.of(context).pop();
              });
            }, 
            child: const Text('Save'))
        ],
      )
    ));
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Aplication'),
        actions: [
          IconButton(
            onPressed: showBottomScreen, 
            icon: const Icon(Icons.add))
        ],
        ),
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: ((context, index) => 
              Dismissible(
                key: Key(todoList[index].title),
                onDismissed: (direction) { 
                  todoList.remove(todoList[index]);
                },
                child: Card(
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: ListTile(title: Text(todoList[index].title),),
                  ),
              )
            )),
          ),
          const SizedBox(width: 40,)
        ],
      ),
    );
  }
}