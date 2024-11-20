import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import '../configs/locator.dart';
import '../services/navigation_service.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<ForgotPasswordPage> {

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _reset() {
    final email = emailController.text;
  }

  @override
  void afterFirstLayout(BuildContext context) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF002B50),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFF002B50),
        leading: IconButton(onPressed: () {
          Navigator.of(locator<NavigationService>().context()).pop();
        },
            icon: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body:
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Column(children: [
                SizedBox(height: 250),
                Text(
                  'Please enter your email to reset password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Optional background color
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    border: Border.all(color: Colors.grey, width: 1), // Grey border
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12), // Add padding around the TextFormField
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: InputBorder.none, // Remove the inner border from TextFormField
                    ),
                  ),
                ),
              ],)),


              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _reset ,
                  child: Text('Reset', style: TextStyle(fontSize: 16, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}