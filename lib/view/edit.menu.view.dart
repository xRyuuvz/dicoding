
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class EditMenuPage extends StatefulWidget {
  final dynamic data;

  const EditMenuPage({Key? key, required this.data}) : super(key: key);

  @override
  _EditMenuPageState createState() => _EditMenuPageState();
}

class _EditMenuPageState extends State<EditMenuPage> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  File? _image;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.data['name']);
    _priceController = TextEditingController(text: widget.data['price']);
    _descriptionController =
        TextEditingController(text: widget.data['description']);
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _updateMenu() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://localhost/phpflutter/update_menu.php"),
    );
    request.fields['id'] = widget.data['id'].toString();
    request.fields['name'] = _nameController.text;
    request.fields['price'] = _priceController.text;
    request.fields['description'] = _descriptionController.text;
    if (_image != null) {
      request.files
          .add(await http.MultipartFile.fromPath('image', _image!.path));
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Menu updated successfully');
      Navigator.pop(context);
    } else {
      print('Failed to update menu');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Menu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            SizedBox(height: 10),
            _buildTextField('Name', _nameController),
            _buildTextField('Price', _priceController),
            _buildTextField('Description', _descriptionController),
            SizedBox(height: 10),
            TextButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _updateMenu,
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: widget.data['image'] != null
          ? CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "http://10.0.2.2/kantin/${widget.data['image']}",
              ),
            )
          : CircleAvatar(
              radius: 60,
              child: Icon(Icons.fastfood),
            ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
