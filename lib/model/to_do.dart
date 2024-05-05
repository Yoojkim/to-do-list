import 'package:flutter/material.dart';

class Todo {
  int? id;
  bool success;
  String content;
  DateTime date;
  bool isDeleted;

  Todo(
      {required this.id,
      required this.success,
      required this.content,
      required this.date,
      required this.isDeleted});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'success': changeBoolToInt(success),
      'content': content,
      'date': getDateStr(date),
      'isDeleted': changeBoolToInt(isDeleted),
    };
  }

  static Todo createTodoByMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      success: changeIntToBool(map['success']),
      content: map['content'],
      date: toDateTime(map['date']),
      isDeleted: changeIntToBool(map['isDeleted']),
    );
  }

  static bool changeIntToBool(int value) {
    if (value == 0) {
      return false;
    }

    return true;
  }

  static int changeBoolToInt(bool value) {
    if (value) {
      return 1;
    }

    return 0;
  }

  static String getDateStr(DateTime dateTime) {
    return '${dateTime.year}.${dateTime.month}.${dateTime.day}';
  }

  static DateTime toDateTime(String date) {
    List<int> dateAttributes =
        date.split(".").map((e) => int.parse(e)).toList();

    return DateTime(dateAttributes[0], dateAttributes[1], dateAttributes[2]);
  }
}
