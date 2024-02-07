import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:newapp/components/my_text_field.dart';

class UploadKey extends StatefulWidget {
  @override
  _UploadKeyState createState() => _UploadKeyState();
}

class _UploadKeyState extends State<UploadKey> {
  String? _fileName;
  final TextEditingController _atsignController = TextEditingController(); // Add this line

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    } else {
      // User canceled the picker
    }
  }

  void _removeFile() {
    setState(() {
      _fileName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Key'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyTextField( // Replace TextField with MyTextField
              controller: _atsignController,
              hintText: 'Enter your @sign',
            ),
            Text(_fileName ?? 'No file selected'),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Select File'),
            ),
            if (_fileName != null)
              IconButton(
                icon: Icon(Icons.close),
                onPressed: _removeFile,
              ),
            if (_fileName != null)
              ElevatedButton(
                onPressed: () {},
                child: Text('Sign In'),
              ),
          ],
        ),
      ),
    );
  }
}
