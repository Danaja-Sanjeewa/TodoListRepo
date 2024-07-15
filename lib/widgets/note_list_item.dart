import 'package:flutter/material.dart';
import '../models/note.dart';
import '../screens/note_detail_screen.dart';

class NoteListItem extends StatelessWidget {
  final Note note;
  final Function onTap;

  NoteListItem({this.note, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(note.description),
      onTap: onTap,
    );
  }
}
