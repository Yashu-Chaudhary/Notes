import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  List<String> notes = [];

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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Write Your Note Here',
                border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
              ),
              onEditingComplete: () {
                setState(() {
                  notes.add(controller.text);
                  controller.clear();
                });
              },
            ),
            Expanded(
              child: ListView(
                children: [
                  ...List.generate(
                    notes.length,
                    (index) => Card(
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          notes[index],
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
