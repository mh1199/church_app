import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../configs/locator.dart';
import '../services/navigation_service.dart';

class AddChurchPage extends StatefulWidget {
  const AddChurchPage({Key? key}) : super(key: key);

  @override
  State<AddChurchPage> createState() => AddChurchPageState();
}

class AddChurchPageState extends State<AddChurchPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<AddChurchPage> {
  final _formKey = GlobalKey<FormState>();
  File? _churchLogo;
  final _picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _denominationController = TextEditingController();
  final TextEditingController _registrationSSMController =
      TextEditingController();
  final TextEditingController _establishDateController =
      TextEditingController();
  final TextEditingController _adminPasterController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void afterFirstLayout(BuildContext context) {}

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _churchLogo = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Church")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Upload Church Logo
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Centers content vertically
                crossAxisAlignment: CrossAxisAlignment.center,
                // Centers content horizontally
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          _churchLogo != null ? FileImage(_churchLogo!) : null,
                      child: _churchLogo == null
                          ? Icon(Icons.add_a_photo, size: 50)
                          : null,
                    ),
                  ),
                  SizedBox(height: 10), // Adds space between image and text
                  Text(
                    'Add Church Logo', // Descriptive text
                    style: TextStyle(
                      color: Colors.blue, // Text color
                      fontSize: 16, // Text size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Church Name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter  name',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
              ),
              SizedBox(height: 10),

              // Address
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Enter address',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a address' : null,
              ),
              SizedBox(height: 10),

              // Denomination
              TextFormField(
                controller: _denominationController,
                decoration: InputDecoration(
                  labelText: 'Enter Denomination',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter denomination' : null,
              ),
              SizedBox(height: 10),

              // Registration/SSM Number
              TextFormField(
                controller: _registrationSSMController,
                decoration: InputDecoration(
                  labelText: 'Enter Registration/SSM Number',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Establish Date
              TextFormField(
                controller: _establishDateController,
                decoration: InputDecoration(
                  labelText: 'Establish Date',
                  suffixIcon: Icon(Icons.calendar_today),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    _establishDateController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
              ),
              SizedBox(height: 10),

              // Senior Paster
              TextFormField(
                controller: _adminPasterController,
                decoration: InputDecoration(
                  labelText: 'Church Admin / Senior Paster',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) => value!.isEmpty
                    ? 'Please enter church admin / senior paster'
                    : null,
              ),
              SizedBox(height: 10),

              // Admin email address
              TextFormField(
                controller: _emailAddressController,
                decoration: InputDecoration(
                  labelText: 'Church Admin - email address',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Password
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Church Admin - password',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Add Now Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process form data
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Church added successfully!")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set button color to blue
                  foregroundColor: Colors.white, // Set text color to white
                ),
                child: Text("Add Now"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
