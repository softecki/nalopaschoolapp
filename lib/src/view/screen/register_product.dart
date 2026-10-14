import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dodomaapp/src/view/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../data/database_helper.dart';
import 'login_screen.dart';

// Conditional import for File
import 'dart:io' if (dart.library.html) 'dart:html' as io;

class RegisterProductScreen extends StatefulWidget {
  @override
  _RegisterProductScreenState createState() => _RegisterProductScreenState();
}

class _RegisterProductScreenState extends State<RegisterProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  dynamic _image; // Changed from File? to dynamic for web compatibility
  final picker = ImagePicker();

  Future<Widget> _buildImageWidget() async {
    if (kIsWeb) {
      final imageFile = _image as XFile;
      final bytes = await imageFile.readAsBytes();
      return Image.memory(bytes, height: 100);
    } else {
      final imageFile = _image as io.File;
      return Image.file(imageFile, height: 100);
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (kIsWeb) {
          _image = pickedFile; // For web, use XFile directly
        } else {
          _image = io.File(pickedFile.path); // For mobile, use File
        }
      });
    }
  }

  Future<void> registerProduct(BuildContext context) async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select an image")),
      );
      return;
    }

    final url = Uri.parse('https://matangazododoma.softecki.com/api/products');

    var request = http.MultipartRequest('POST', url);
    request.fields['name'] = nameController.text;
    request.fields['price'] = priceController.text;
    request.fields['description'] = descriptionController.text;
    
    // Handle file upload for both web and mobile
    if (kIsWeb) {
      // For web, use XFile.readAsBytes()
      final imageFile = _image as XFile;
      final bytes = await imageFile.readAsBytes();
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        bytes,
        filename: imageFile.name,
      ));
    } else {
      // For mobile, use file path
      final imageFile = _image as io.File;
      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
    }

    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    var jsonResponse = jsonDecode(responseData);

    if (response.statusCode == 201) {
      final product = {
        'name': nameController.text,
        'price': priceController.text,
        'description': descriptionController.text,
        'image': kIsWeb ? (_image as XFile).name : (_image as io.File).path,
      };
      // await DatabaseHelper.instance.insertProduct(product);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Product Registered!")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(jsonResponse['message'] ?? 'Registration Failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Product')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DatabaseHelper.instance.getUsers()!= null ? Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Product Name')),
            TextField(controller: priceController, decoration: InputDecoration(labelText: 'Price'), keyboardType: TextInputType.number),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Description')),
            const SizedBox(height: 10),
            _image == null
                ? Text("No Image Selected")
                : FutureBuilder<Widget>(
                    future: _buildImageWidget(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!;
                      }
                      return CircularProgressIndicator();
                    },
                  ),
            ElevatedButton(
              onPressed: pickImage,
              child: Text("Select Image"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => registerProduct(context),
              child: Text('Register Product'),
            ),
          ],
        ):Container(
          height: 250, // Adjust height
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center, // Add this
            crossAxisAlignment: CrossAxisAlignment.center, // Add this
            children: [
              const Text(
                "Welcome!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Login"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
