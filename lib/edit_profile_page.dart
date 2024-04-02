import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String username;
  final ValueChanged<String>? onUpdate;

  EditProfilePage({required this.username, this.onUpdate});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.username);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (widget.onUpdate != null) {
                  widget.onUpdate!(_controller.text);
                }
                Navigator.pop(context, _controller.text); // Pass back the updated username
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}