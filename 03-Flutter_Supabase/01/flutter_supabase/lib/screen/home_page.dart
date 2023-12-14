import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _noteController = TextEditingController();
  final _notes =
      Supabase.instance.client.from('notes').stream(primaryKey: ['id']);

  Future<void> addNote() async {
    await Supabase.instance.client
        .from('notes')
        .insert({'note': _noteController.text});
  }

  Future<void> updateNote(final id) async {
    await Supabase.instance.client
        .from('notes')
        .update({'note': _noteController.text}).match({'id': id});
  }

  Future<void> deleteNote(final id) async {
    await Supabase.instance.client.from('notes').delete().match({'id': id});
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _showDialog(
    BuildContext context,
    TextEditingController controller,
    void Function()? onPressedCancel,
    void Function()? onPressedDone,
  ) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Add note...'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: onPressedCancel,
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: onPressedDone,
                    child: const Text('Done'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: Colors.limeAccent,
      ),
      body: StreamBuilder(
        stream: _notes,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final notes = snapshot.data!;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(notes[index]['note']),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        deleteNote(notes[index]['id']);
                      },
                      child: const Text('Delete'),
                    ),
                    TextButton(
                      onPressed: () {
                        TextEditingController controller =
                            TextEditingController(text: notes[index]['note']);
                        _noteController = controller;
                        _showDialog(
                          context,
                          _noteController,
                          () {
                            _noteController.clear();
                            Navigator.of(context).pop();
                          },
                          () {
                            updateNote(notes[index]['id']);
                            _noteController.clear();
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      child: const Text('Update'),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(
            context,
            _noteController,
            () {
              _noteController.clear();
              Navigator.of(context).pop();
            },
            () {
              addNote();
              _noteController.clear();
              Navigator.of(context).pop();
            },
          );
        },
        child: const Icon(Icons.note_add),
      ),
    );
  }
}
