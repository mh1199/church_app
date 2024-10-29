import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

class CertPage extends StatefulWidget {
  const CertPage({Key? key}) : super(key: key);

  @override
  State<CertPage> createState() => CertPageState();
}

class CertPageState extends State<CertPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<CertPage> {

  File? _image;

  @override
  void afterFirstLayout(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return
      Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Text("My Certificate", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),)
              ],),
              SizedBox(height: 30,),

              _image != null
                  ? Image.file(
                _image!,
                width: screenWidth, // Set width to screen width
                fit: BoxFit.fitWidth, // Fit the image width
              )
                  : Image.asset(
                'assets/images/no-cert.png', // Use the asset image
                width: screenWidth, // Set width to screen width
                fit: BoxFit.fitWidth, // Fit the image width
              ),
              SizedBox(height: 20), // Space between image and text
              Text(
                'No Certificate',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // Space between title and description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text.rich(
                  TextSpan(
                    text: 'Contact ',
                    style: TextStyle(fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: '012-1231421',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' or email '),
                      TextSpan(
                        text: 'church@gmail.com',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' to request your E-Baptism or E-member certificate.'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20), // Space for button
            ],
          ),
        ),
      );
  }
}