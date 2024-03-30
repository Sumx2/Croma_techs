// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class SpeakerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speakers'),
      ),
      body: ListView(
        children: <Widget>[
          SpeakerCard(
            speaker: Speaker(
              name: 'JBL Flip 4',
              description: 'Portable Bluetooth Speaker',
              price: 99.99,
              imageUrl: 'https://example.com/jbl_flip4.jpg',
            ),
          ),
          // Add more SpeakerCard widgets with different speakers here
        ],
      ),
    );
  }
}

class Speaker {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Speaker({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class SpeakerCard extends StatelessWidget {
  final Speaker speaker;

  SpeakerCard({required this.speaker});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.network(
            speaker.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(speaker.name),
            subtitle: Text(speaker.description),
            trailing: Text('\$${speaker.price.toStringAsFixed(2)}'),
          ),
          // Add more information as needed (e.g., ratings, reviews, etc.)
        ],
      ),
    );
  }
}
