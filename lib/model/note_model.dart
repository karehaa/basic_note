import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String title;
  final String content;
  final DateTime date;
  final String color;

  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'],
      content: json['content'],
      date: (json['date'] as Timestamp).toDate(),
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'content': content, 'date': date, 'color': color};
  }
}
