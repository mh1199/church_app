import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import '../configs/locator.dart';
import '../configs/routes_handler.dart';
import '../services/navigation_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final email = emailController.text;
    final password = passwordController.text;

    // Handle login logic (for demonstration purposes)
    print('Email: $email, Password: $password');

    // Navigator.of(locator<NavigationService>().context()).pop();

    Routes.router.navigateTo(locator<NavigationService>().context(), Routes.otp,replace: false);


    // Add your login validation or API call here
  }

  @override
  void afterFirstLayout(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () async {
          // Returning false disables the back button
          return false;
        },
        child: Scaffold(
          backgroundColor: Color(0xFFF002B50),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Color(0xFFF002B50),
            leading: IconButton(onPressed: () {
              var route = '${Routes.register}';
              locator<NavigationService>().navigateUntil(route);
            },
                icon: Icon(Icons.arrow_back, color: Colors.white,)),
          ),
          body:
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const Text(
          //         'Welcome to the Church Member Portal',
          //         style: TextStyle(
          //           fontSize: 24,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.blue,
          //         ),
          //         textAlign: TextAlign.center,
          //       ),
          //       const SizedBox(height: 32.0), // Space between welcome text and input fields
          //       TextField(
          //         controller: emailController,
          //         decoration: InputDecoration(
          //           labelText: 'Email',
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //       const SizedBox(height: 16.0),
          //       TextField(
          //         controller: passwordController,
          //         obscureText: true,
          //         decoration: InputDecoration(
          //           labelText: 'Password',
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //       const SizedBox(height: 16.0),
          //       TextButton(
          //         onPressed: _login,
          //         child: const Text('BACK', style: TextStyle(color: Colors.white),),
          //         style: TextButton.styleFrom(
          //           backgroundColor: Colors.blue, // Button color
          //         ),
          //       ),
          //       const SizedBox(height: 16.0),
          //       GestureDetector(
          //         onTap: () {
          //           // Handle forgot password logic
          //           print('Forgot Password tapped');
          //         },
          //         child: const Text(
          //           'Forgot Password?',
          //           style: TextStyle(
          //             color: Colors.blue,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
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
                      'Welcome to Church A',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
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
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Optional background color
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        border: Border.all(color: Colors.grey, width: 1), // Grey border
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12), // Add padding around the TextFormField
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
                  ],)),
        
        
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                        _login
                      ,
                      child: Text('Login', style: TextStyle(fontSize: 16, color: Colors.white)),
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
                  TextButton(
                    onPressed: () {
                      Routes.router.navigateTo(
                          locator<NavigationService>().context(), Routes.forgotPassword);
                    },
                    child: Text(
                      'Forget password?',
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
