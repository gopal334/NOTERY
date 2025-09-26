import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'db_helper.dart';
import 'note_model.dart';
import 'note_provider.dart';

class NoteFormPage extends StatefulWidget {
  final bool isUpdate;
  final Note? note;

  NoteFormPage({required this.isUpdate, this.note});

  @override
  State<NoteFormPage> createState() => _NoteFormPageState();
}

class _NoteFormPageState extends State<NoteFormPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate && widget.note != null) {
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isUpdate ? "Update Note" : "Add Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),

              ),
              child: TextField(

                controller: _titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                    labelText: "Title",
                    hintText: "Enter your title here",),

              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),

              ),
              child: TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Description",
                    hintText: "Enter your description here",

                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (widget.isUpdate) {
                  context.read<NotesProvider>().updateNote(
                    widget.note!.id!,
                    _titleController.text,
                    _descriptionController.text,
                  );
                } else {
                  context.read<NotesProvider>().addNote(
                    _titleController.text,
                    _descriptionController.text,
                  );
                }
                Navigator.pop(context);
              },
              child: Text(widget.isUpdate ? "Update" : "Add"),
            ),
          ],
        ),
      ),
    );
  }
}
