import 'package:flutter/material.dart';
import 'add_note_screen.dart';
import '../db/database_helper.dart';
import '../models/note.dart';
import '../widgets/note_list_item.dart';
import '../widgets/custom_app_bar.dart';
import 'note_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _fetchNotes();
  }

  _fetchNotes() async {
    final notes = await DatabaseHelper().getNotes();
    setState(() {
      _notes = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ToDo List'),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return NoteListItem(
            note: _notes[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteDetailScreen(note: _notes[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          ).then((value) {
            _fetchNotes();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
