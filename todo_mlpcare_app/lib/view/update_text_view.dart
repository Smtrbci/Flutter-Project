import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_mlpcare_app/data/icons_data.dart';
import 'package:todo_mlpcare_app/data/realtimedatabesservice.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';
import 'package:todo_mlpcare_app/utilities/appbar_view.dart';
import 'package:flutter/cupertino.dart';

class UpdateTextView extends StatefulWidget {
  final Todo todo;

  const UpdateTextView({
    super.key,
    required this.todo,
  });

  @override
  State<UpdateTextView> createState() => _UpdateTextViewState();
}

class _UpdateTextViewState extends State<UpdateTextView> {
  IconData? _selectedIcon;
  final RealtimeDatabaseService _databaseService = RealtimeDatabaseService();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.todo.title;
    _selectedIcon = widget.todo.icon;
  }

  void _updateTodo() {
    if (_controller.text.isNotEmpty) {
      widget.todo.updateTitle(_controller.text);
      widget.todo.updateIcon(_selectedIcon);
      _databaseService.updateTodo(widget.todo).then((_){
        Navigator.of(context).pop(widget.todo);
      });
      //_databaseService.updateTodoTitle(widget.todo.id, _controller.text);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(66, 85, 99, 70),
      appBar: const AppBarView(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Kategori Seçiniz:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: IconList.icons.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon = IconList.icons[index];
                      });
                    },
                    child: Container(
                      width: 60,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: _selectedIcon == IconList.icons[index]
                            ? Colors.blueGrey
                            : const Color.fromRGBO(66, 85, 99, 50),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(
                        IconList.icons[index],
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(66, 85, 99, 50),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                _selectedIcon,
                color: Colors.white,
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 450,
                width: 400,
                child: TextField(
                  maxLines: 22,
                  minLines: 1,
                  style: const TextStyle(color: Colors.white),
                  controller: _controller,
                  decoration: const InputDecoration(
                    //contentPadding: EdgeInsets.symmetric(vertical: 100.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0, color: Colors.white),
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: _updateTodo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(66, 85, 99, 50),
                  ),
                  child: const Text(
                    'Güncelle',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
