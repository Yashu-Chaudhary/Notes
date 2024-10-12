import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dynamic device = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Note',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(18),
              padding: const EdgeInsets.all(15),
              height: device.size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1)),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.black45),
                        border: InputBorder.none
                        ),
                  ),
                  TextField(
                    controller: discriptionController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                        hintText: 'Discription',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none
                        ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
