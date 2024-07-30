import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> notes = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Write Your Note Here'),
        backgroundColor: Colors.blue,
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: ,
            ),
          ],
        ),
      ),
    );
  }
}
