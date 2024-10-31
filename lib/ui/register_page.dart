import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import '../configs/locator.dart';
import '../configs/routes_handler.dart';
import '../helpers/constants.dart';
import '../services/navigation_service.dart';
import 'base_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<RegisterPage> {

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void afterFirstLayout(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Returning false disables the back button
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Church Logo
              Image.asset(
                Constants.PATH_PLACEHOLDER_LOGIN, // Replace with your logo path
                height: 100,
                width: 100,
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to Church A',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 32),

              // Name Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Email Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Password Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Confirm Password Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Routes.router.navigateTo(
                               locator<NavigationService>().context(), Routes.base,
                             replace: true);
                  },
                  child: Text('Sign Up', style: TextStyle(fontSize: 16, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Login Link
              GestureDetector(
                onTap: () {
                  Routes.router.navigateTo(locator<NavigationService>().context(), Routes.login);
                },
                child: Text(
                  'Already a member? Login Here',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}