import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_mlpcare_app/data/icons_data.dart';
import 'package:todo_mlpcare_app/data/realtimedatabesservice.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';
import 'package:todo_mlpcare_app/utilities/appbar_view.dart';

@RoutePage()
class UpdateTextView extends StatefulWidget {
  final Todo? todo;

  UpdateTextView({
    Key? key,
    this.todo,
  }) : super(key: key);

  @override
  _UpdateTextViewState createState() => _UpdateTextViewState();
}

class _UpdateTextViewState extends State<UpdateTextView> {
  IconData? _selectedIcon;
  final RealtimeDatabaseService _databaseService = RealtimeDatabaseService();
  final TextEditingController _controller = TextEditingController();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _controller.text = widget.todo!.title;
      _selectedIcon = widget.todo!.icon;
    }
  }

  void _updateTodo() async{
    if (_controller.text.isNotEmpty && !_isSaving) {
      setState(() {
        _isSaving = true;
      });
    }
      if (widget.todo != null) {
        widget.todo!.title = _controller.text;
        widget.todo!.icon = _selectedIcon;
        _databaseService.updateTodo(widget.todo!).then((_) {
          Navigator.of(context).pop(widget.todo);
        });
      } else {
        Todo newTodo = Todo(
          id: DateTime.now().toString(),
          title: _controller.text,
          isDone: false,
          icon: _selectedIcon,
        );
        _databaseService.addTodo(newTodo).then((_) {
          Navigator.of(context).pop(newTodo);
        });
      }
      setState(() {
        _isSaving = false;
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(66, 85, 99, 70),
      appBar: const AppBarView(
        title: 'Todo Güncelle',
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
                child: Text(
                  widget.todo != null ? 'Güncelle' : 'Oluştur',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
