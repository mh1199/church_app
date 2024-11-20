import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../configs/locator.dart';
import '../configs/routes_handler.dart';
import '../services/navigation_service.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => OtpPageState();
}

  class OtpPageState extends State<OtpPage> with AfterLayoutMixin<OtpPage> {

    @override
    void afterFirstLayout(BuildContext context) {

    }

    void _verify() {
      // final email = emailController.text;
      // final password = passwordController.text;

      // Handle login logic (for demonstration purposes)
      // print('Email: $email, Password: $password');

      // Navigator.of(locator<NavigationService>().context()).pop();

      Routes.router.navigateTo(locator<NavigationService>().context(), Routes.thirdSplash,replace: true);


      // Add your login validation or API call here
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF002B50),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFF002B50),
        leading: IconButton(onPressed: () {
          var route = '${Routes.login}';
          locator<NavigationService>().navigateUntil(route);
        },
            icon: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white, // White card background
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Text(
                'Enter Your 4 digit code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.orange[50], // Light orange background
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "assets/images/mailbox.png", // Replace with your logo path
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(height: 20),
              PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (value) {},
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeColor: Colors.orange,
                  selectedColor: Colors.orange[700],
                  inactiveColor: Colors.grey[300],
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Did you not get code? "),
                  GestureDetector(
                    onTap: () {
                      // Resend action
                    },
                    child: Text(
                      'Resend',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                _verify
                ,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}