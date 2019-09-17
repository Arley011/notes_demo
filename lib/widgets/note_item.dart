import 'package:flutter/material.dart';

import '../models/note.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  NoteItem(this.note);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            child: Image.file(
              note.imageUrl,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.31,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.31,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    note.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Divider(
                    color: Colors.blue,
                    height: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SingleChildScrollView(
                        child: Text(
                          note.text,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
