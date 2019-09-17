import 'dart:io';

import 'package:flutter/material.dart';
import '../widgets/image_input.dart';

class AddNoteScreen extends StatefulWidget {

  final Function addToList;
  static const routeName = '/add-note';

  AddNoteScreen(this.addToList);
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _textController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _saveNote(){
    if(_titleController.text.isEmpty || _pickedImage == null || _textController.text.isEmpty){
      return;
    }
    widget.addToList(title: _titleController.text, text: _textController.text, imagePath: _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Note'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                ),
                child: Column(children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Description'),
                    controller: _textController,
                    maxLines: 6,
                  ),
                  SizedBox(height: 10,),
                  ImageInput(_selectImage),
                ],),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: _saveNote,
            icon: Icon(Icons.add),
            label: Text('Add Note'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme
                .of(context)
                .accentColor,
          ),
        ],
      ),
    );
  }
}
