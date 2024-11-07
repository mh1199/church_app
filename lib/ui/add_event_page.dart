import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../configs/locator.dart';
import '../services/navigation_service.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => AddEventPageState();
}

class AddEventPageState extends State<AddEventPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<AddEventPage> {
  final _formKey = GlobalKey<FormState>();
  File? _eventBanner;
  final _picker = ImagePicker();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _modeController = TextEditingController();
  final TextEditingController _registrationDeadlineController =
      TextEditingController();
  final TextEditingController _eventDateController = TextEditingController();
  final TextEditingController _topicController = TextEditingController();
  String? _rsvpStatus;

  @override
  void afterFirstLayout(BuildContext context) {}

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _eventBanner = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Event")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Upload Event Banner
              // Upload Event Banner
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
                      backgroundImage: _eventBanner != null
                          ? FileImage(_eventBanner!)
                          : null,
                      child: _eventBanner == null
                          ? Icon(Icons.add_a_photo, size: 50)
                          : null,
                    ),
                  ),
                  SizedBox(height: 10), // Adds space between image and text
                  Text(
                    'Add Event Banner', // Descriptive text
                    style: TextStyle(
                      color: Colors.blue, // Text color
                      fontSize: 16, // Text size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Event Title
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Enter event title',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a title' : null,
              ),
              SizedBox(height: 10),

              // Description
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Enter event description',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a description' : null,
              ),
              SizedBox(height: 10),

              // Location
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Enter location',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a location' : null,
              ),
              SizedBox(height: 10),

              // Mode
              TextFormField(
                controller: _modeController,
                decoration: InputDecoration(
                  labelText: 'Enter mode',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Registration Deadline
              TextFormField(
                controller: _registrationDeadlineController,
                decoration: InputDecoration(
                  labelText: 'Enter registration deadline',
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
                    _registrationDeadlineController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
              ),
              SizedBox(height: 10),

              // Event Date
              TextFormField(
                controller: _eventDateController,
                decoration: InputDecoration(
                  labelText: 'Enter event date',
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
                    _eventDateController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
              ),
              SizedBox(height: 10),

              // Topic of the Day
              TextFormField(
                controller: _topicController,
                decoration: InputDecoration(
                  labelText: 'Enter topics of the day',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // RSVP Status
              DropdownButtonFormField<String>(
                value: _rsvpStatus,
                decoration: InputDecoration(
                  labelText: 'Select Status',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                items: ['Going', 'Interested', 'Not Going']
                    .map((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _rsvpStatus = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a status' : null,
              ),
              SizedBox(height: 20),

              // Add Now Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process form data
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Event added successfully!")),
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
