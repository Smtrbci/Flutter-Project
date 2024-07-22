import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_mlpcare_app/cosntant/app_const/icon.dart';
import 'package:todo_mlpcare_app/cosntant/app_const/text.dart';
import 'package:todo_mlpcare_app/cosntant/app_const/theme.dart';
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

  void _updateTodo() async {
    if (_controller.text.isNotEmpty && !_isSaving) {
      setState(() {
        _isSaving = true;
      });
      if (widget.todo != null) {
        widget.todo!.title = _controller.text;
        widget.todo!.icon = _selectedIcon;
        await _databaseService.updateTodo(widget.todo!);
        context.router.popForced(widget.todo);
      } else {
        Todo newTodo = Todo(
          id: _databaseService.generateId(),
          title: _controller.text,
          isDone: false,
          icon: _selectedIcon,
        );
        await _databaseService.addTodo(newTodo);
        context.router.popForced(newTodo);
      }
      setState(() {
        _isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkAppTheme.CenterColor,
      appBar: AppBarView(title: ''),
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
                            ? DarkAppTheme.ButtonColor
                            : DarkAppTheme.TodoColor,
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
            const SizedBox(height: 20),
            Center(
                child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: DarkAppTheme.TodoColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                _selectedIcon,
                color: Colors.white,
              ),
            )),
            const SizedBox(height: 20),
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
            const SizedBox(height: 60),
            Center(
              child: ElevatedButton(
                onPressed: _updateTodo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: DarkAppTheme.ButtonColor,
                ),
                child: Text(
                  widget.todo != null ? Texts.ButtonNameG : Texts.ButtonNameO,
                  style: TextStyle(
                      fontWeight: TextStyles.TextBold,
                      color: DarkAppTheme.TextColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
