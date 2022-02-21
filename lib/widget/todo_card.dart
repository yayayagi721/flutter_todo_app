import 'package:flutter/material.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/view/todo_list_view.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class TodoCard extends HookConsumerWidget {
  final Todo todo;
  TodoCard(this.todo);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListNotifier = ref.read(todoListStateProvider.notifier);

    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Dismissible(
          direction: DismissDirection.endToStart,
          key: Key(todo.id),
          background: Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(color: Color(0xFFDA4242)),
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.delete,
                  size: 40,
                ),
              )),
          onDismissed: (_) {
            todoListNotifier.delete(todo);
          },
          child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  enableDrag: false,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  isDismissible: false,
                  context: context,
                  builder: (context) => TodoInputForm(SaveType.update, todo),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  child: IntrinsicHeight(
                    child: Row(children: [
                      Container(
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                          )),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            _title(todo.title),
                            SizedBox(
                              height: 5,
                            ),
                            _description(
                                todo.locationInfo.address ?? "位置情報未読み込み"),
                            SizedBox(
                              height: 5,
                            ),
                            _subContent(Icons.watch_later,
                                DateFormat('HH:mm').format(todo.eventAt)),
                          ],
                        ),
                      ))
                    ]),
                  ),
                ),
              )),
        ));
  }

  Widget _title(String text) {
    return Container(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ));
  }

  Widget _description(String text) {
    return Container(
        alignment: AlignmentDirectional.centerStart,
        child:
            Text(text, style: TextStyle(fontSize: 14, color: Colors.black54)));
  }

  Widget _subContent(IconData icon, String text) {
    return Container(
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 5,
            ),
            Text(text)
          ],
        ));
  }
}
