import 'dart:io';
import 'package:authentication_crud/helpers/colors.dart';
import 'package:authentication_crud/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  File? selectedImage;
  final CollectionReference student =
      FirebaseFirestore.instance.collection('student');

  void addStudent() {
    final data = {
      'name': nameController.text,
      'age': ageController.text,
      'profile': selectedImage
    };
    student.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: Text(
                    'Enter User Details!',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: appcolor),
                  ),
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: CircleAvatar(
                    backgroundColor: appcolor,
                    backgroundImage: selectedImage != null
                        ? FileImage(selectedImage!)
                        : const AssetImage('assets/person img.png')
                            as ImageProvider,
                    radius: 60,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        _imagePicker(context, ImageSource.camera);
                      },
                      child: const Text(
                        'Camera',
                        style: TextStyle(color: appcolor),
                      ),
                    ),
                    const SizedBox(width: 30),
                    TextButton(
                      onPressed: () {
                        _imagePicker(context, ImageSource.gallery);
                      },
                      child: const Text(
                        'Gallery',
                        style: TextStyle(color: appcolor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.grey.shade700))),
                const SizedBox(height: 10),
                TextField(
                    keyboardType: TextInputType.number,
                    controller: ageController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Age',
                        hintStyle: TextStyle(color: Colors.grey.shade700))),
                const SizedBox(height: 60),
                ButtonWidget(
                  onTap: () {
                    addStudent();
                    Navigator.pop(context);
                  },
                  text: 'Save',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _imagePicker(BuildContext context, ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  
}
