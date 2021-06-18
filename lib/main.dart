import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MyPicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPicker(title: 'Flutter MyPicker'),
    );
  }
}

class MyPicker extends StatefulWidget {
  MyPicker({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyPickerState createState() => _MyPickerState();
}

class _MyPickerState extends State<MyPicker> {
  File _image;
  ImagePicker MyPicker;

  @override
  void initState() {
    super.initState();
    MyPicker = ImagePicker();
  }

  Future<void> _chooseGallery() async {
    PickedFile pickedFile = await MyPicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }



  Future<void> _chooseCamera() async {
    PickedFile pickedFile =
        await MyPicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null ? Image.file(_image) : Icon(Icons.image),
            MaterialButton(
                onPressed: _chooseGallery,
                onLongPress: _chooseCamera,
                child: Text('choose/capture'))
          ],
        ),
      ),
    );
  }
}
