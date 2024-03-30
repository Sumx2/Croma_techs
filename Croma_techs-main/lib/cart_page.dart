// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\t\t\t\t\t\t\t\t\t\t\t\tOOPS!\n Your cart is empty!',
              style: TextStyle(fontSize: 30),

            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add functionality to go back to the previous page (e.g., HomePage)
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
