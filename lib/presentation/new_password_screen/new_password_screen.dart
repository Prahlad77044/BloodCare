import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'package:http/http.dart' as http;

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController OTPController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Future sendToBackend() async {
    final response = await http.post(
      Uri.parse(
          'http://192.168.159.163:4444/api/user/reset-password-with-otp/'), // Replace this URL with your backend endpoint
      headers: <String, String>{
        'Content-Type': 'application/json',
        // Add other headers if needed
      },
      body: jsonEncode(
        {
          'new_password': newPasswordController.text.toString(),
          'email': emailController.text.toString(),
          'otp': OTPController.text.toString()
        },
      ),
    );
    print('${response.body}');
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Successful',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            content: Text('Your Password has been changed successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/log_in_screen');
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    // Handle response from backend as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('New Password Screen', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[800],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Please check your email for OTP.',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: OTPController,
                decoration: InputDecoration(labelText: 'OTP'),
              ),
              TextFormField(
                controller: newPasswordController,
                decoration: InputDecoration(labelText: 'New Password'),
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                    sendToBackend();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
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
