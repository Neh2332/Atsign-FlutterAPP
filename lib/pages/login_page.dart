import 'package:flutter/material.dart';
import 'package:newapp/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center( // This centers its child
          child: Column(
            children: <Widget>[
              // logo
              Icon(
                Icons.message,
                size: 80,
                color: Colors.orange,
              ),

              //welcome message
              const Text(
                'Welcome to AtChat!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //Atsign textfield
              MyTextField(
                controller: TextEditingController(),
                hintText: 'Enter your Atsign',


              ),

              //uploadkey button
              ElevatedButton(
                onPressed: () {
                  //navigate to the upload key page
                },
                child: const Text('Upload Key'),
              ),


              //sign in button
              ElevatedButton(
                onPressed: () {
                  //navigate to the chat page
                },
                child: const Text('Sign in'),
              ),

              //dont have an Atsign? Sign up
            ],
          ),
        ),
      ),
    );
  }
}
