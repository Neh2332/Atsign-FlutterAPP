import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Contacts Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
