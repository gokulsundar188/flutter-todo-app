import 'package:flutter/material.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const TodoHome(),
    );
  }
}

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final List<String> _todoList = [];

  final _todoController = TextEditingController();
  final _todoFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  int? _editIndex;

  @override
  void dispose() {
    _todoController.dispose();
    _todoFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 2,
        title: Text("Todos", style: TextStyle(fontSize: 24, fontWeight: .bold)),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: .min,
          spacing: 10,
          crossAxisAlignment: .center,
          mainAxisAlignment: .start,
          children: [
            Row(
              mainAxisSize: .min,
              spacing: 10,
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _todoController,
                      focusNode: _todoFocusNode,

                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return "Todo can't be empty";
                        }

                        return null;
                      },

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Add todo",

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blueGrey[100]!),
                        ),
                      ),
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: _onSave,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(80, 40),
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(_editIndex == null ? "Add todo" : "Update todo"),
                ),
              ],
            ),

            Divider(),

            Expanded(
              child: _todoList.isEmpty
                  ? Center(
                      child: Text(
                        "No todos",
                        style: TextStyle(fontSize: 18, fontWeight: .bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _todoList.length,
                      itemBuilder: (context, index) {
                        var task = _todoList[index];

                        return ListTile(
                          title: Text(
                            task,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          trailing: Row(
                            mainAxisSize: .min,
                            spacing: 10,
                            children: [
                              IconButton(
                                onPressed: () => _onEdit(index),
                                color: Colors.amber,
                                icon: Icon(Icons.edit, size: 20),
                              ),
                              IconButton(
                                onPressed: () => _onDelete(index),
                                color: Colors.red,
                                icon: Icon(Icons.delete, size: 20),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  //   events
  void _onSave() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      var task = _todoController.text.trim();

      if (_editIndex != null) {
        _todoList[_editIndex!] = task;
        _editIndex = null;
      } else {
        _todoList.add(task);
      }

      _todoController.clear();
      _todoFocusNode.unfocus();
    });
  }

  void _onEdit(int index) {
    setState(() {
      _editIndex = index;
      _todoController.text = _todoList[index];

      _todoFocusNode.requestFocus();
    });
  }

  void _onDelete(int index) {
    setState(() => _todoList.removeAt(index));
  }
}
