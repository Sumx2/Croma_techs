import 'package:flutter/material.dart';

class ACPage extends StatelessWidget {
  const ACPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Conditioners'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Image.network('Image URL for AC $index');
        },
      ),
    );
  }
}
