import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:newapp/components/my_text_field.dart';
import 'package:newapp/components/backendservice.dart'; // Import your backend service
import 'package:permission_handler/permission_handler.dart'; // Import permission handler

class UploadKey extends StatefulWidget {
  @override
  _UploadKeyState createState() => _UploadKeyState();
}

class _UploadKeyState extends State<UploadKey> {
  String? _fileName;
  final TextEditingController _atsignController = TextEditingController();

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.path; // Use .path instead of .name
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

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
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
            MyTextField(
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
                onPressed: () async {
                  await requestStoragePermission();
                  String? fileName = _fileName;
                  if (fileName != null) {
                    BackendService.validateAtsignAndKey(
                        _atsignController.text, fileName);
                  }
                },
                child: Text('Sign In'),
              ),
          ],
        ),
      ),
    );
  }
}
