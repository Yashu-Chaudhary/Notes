import 'package:flutter/material.dart';
import 'package:notes/add_screen.dart';

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
        child: ListView.builder(
            itemCount: 7,
            itemBuilder: ((context, index) {
              return ListTile(
                  leading: CircleAvatar(
                    child: Text('$index'),
                  ),
                  title: const Text('Title'),
                  subtitle: const Text('Description'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_forever_outlined),
                  ));
            })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AddScreen()));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
