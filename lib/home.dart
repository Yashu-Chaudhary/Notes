import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes/add_screen.dart';
import 'package:notes/notes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  List<String> notes = [];

  List<Notes> list = [];
  late SharedPreferences sharedPreferences;

  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? stringList = sharedPreferences.getStringList('list');
    if (stringList != null) {
      list =
          stringList.map((item) => Notes.fromMap(json.decode(item))).toList();
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: list.isEmpty
          ? const Center(
              child: Text(
              'Write Your Note here!.',
              style: TextStyle(),
            ))
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                        leading: CircleAvatar(
                          child: Text('${index+1}'),
                        ),
                        title: Text(list[index].title),
                        subtitle: Text(list[index].description),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              list.remove(list[index]);
                              List<String> strList = list
                                  .map((item) => json.encode(item.toMap()))
                                  .toList();
                              sharedPreferences.setStringList('list', strList);
                            });
                          },
                          icon: const Icon(Icons.delete_forever_outlined),
                        ));
                  })),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String referesh = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddScreen()));
          if (referesh == 'loadData') {
            setState(() {
              getData();
            });
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
