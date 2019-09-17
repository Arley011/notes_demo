import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notes_demo/widgets/note_item.dart';

import './add_note_screen.dart';
import '../models/note.dart';

class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  void _addNote({String title, String text, File imagePath}) {
    final newNote = Note(
      id: DateTime.now().toString(),
      title: title,
      text: text,
      imageUrl: imagePath,
    );
    setState(() {
      _notes.add(newNote);
    });
    print('HELLO THERE');
  }



  final List<Note> _notes = [];

  @override
  Widget build(BuildContext context) {

    Widget _buildEmptyNotesList(BuildContext context){
      return LayoutBuilder(
        builder: (ctx, constraints) {
          return Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image(
                        image: AssetImage(
                          'assets/images/note.jpg',
                        ),
                        fit: BoxFit.cover,
                      )),
                  height: constraints.maxHeight * 0.5,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'No notes yet!',
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
          );
        },
      );
    }


    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text('Your notes'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddNoteScreen(_addNote),
                ),
              );
            },
          ),
        ],
      ),
      body: _notes.isEmpty
          ? _buildEmptyNotesList(context)
          : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (ctx, i) => NoteItem(_notes[i]),
            ),
    );
  }
}
