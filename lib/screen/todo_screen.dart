import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/component/logo.dart';
import 'package:todolist/state/standard_date_provider.dart';
import 'package:todolist/widget/date_widget.dart';
import 'package:todolist/widget/todo_widget.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StandardDate standardDate = Provider.of<StandardDate>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Logo(
          width: 90,
          height: 90,
        ),
        title: const Text(
          'ㅌㄷㅌㄷ',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              standardDate.changeDate(DateTime.now());
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          DateNavigator(
            today: today,
          ),
          const Padding(
            padding: EdgeInsets.all(
              5.0,
            ),
          ),
          const ToDoList(),
        ],
      )),
    );
  }
}
