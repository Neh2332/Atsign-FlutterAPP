import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadKey extends StatefulWidget {
  @override
  _UploadKeyState createState() => _UploadKeyState();
}

class _UploadKeyState extends State<UploadKey> {
  String? _fileName;

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
            Text(_fileName ?? 'No file selected'),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Select File'),
            ),
          ],
        ),
      ),
    );
  }
}