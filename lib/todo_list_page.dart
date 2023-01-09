import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textEditingController = TextEditingController();

  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 46, 46),
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              children: const [
                Icon(Icons.note_alt_rounded),
              ],
            ),
            const Center(widthFactor: 4.7, child: Text('To-Do List'))
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // NOTE FIELD
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: TextField(
                decoration: const InputDecoration.collapsed(
                  hintText: 'Type a note',
                  hintStyle: TextStyle(color: Colors.white60),
                  enabled: true,
                ),
                style: const TextStyle(color: Colors.white),
                controller: _textEditingController,
              ),
            ),
            //NOTE FIELD

            //CREATE NOTE BUTTON
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: ElevatedButton(
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      setState(() {
                        tarefas.add(_textEditingController.text);
                      });
                      _textEditingController.clear();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text("Note"), Icon(Icons.add)],
                  )),
            ),
            //CREATE NOTE BUTTON

            //NOTE LIST CONTAINER
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 400,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          child: TextButton(
                            onLongPress: () {
                              setState(() {
                                tarefas.removeAt(index);
                              });
                            },
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(
                                  width: 0.5, color: Colors.white),
                              textStyle: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Note ${index + 1} | ',
                                  style: const TextStyle(color: Colors.pink),
                                ),
                                Text(tarefas[index])
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ]),
            //NOTE LIST CONTAINER

            // DELETE ALL NOTES BUTTON
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {
                    {
                      setState(() {
                        tarefas = [];
                      });
                      _textEditingController.clear();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Delete all notes"),
                      Icon(Icons.delete)
                    ],
                  )),
            ),
            // DELETE ALL NOTES BUTTON
          ],
        ),
      ),
    );
  }
}
