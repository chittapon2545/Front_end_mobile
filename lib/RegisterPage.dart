import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _registerState();
}

class _registerState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  Future sign_up() async {
    String url = "http://localhost/flutter_login/register.php";
    final response = await http.post(Uri.parse(url), body: {
      'username': name.text,
      'password': pass.text,
      'email': email.text,
      'phone': phone.text
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'RegisterPage');
    } else {
      await user.setsignin(true);
      Navigator.pushNamed(context, 'HomePage');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'สมัครบัญชีแฟนเช่า',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _buildTextFormField(
                label: 'USERNAME',
                controller: name,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextFormField(
                label: 'PASSWORD',
                obscureText: true,
                controller: pass,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextFormField(
                label: 'RE_TYPE_PASSWORD',
                obscureText: true,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Empty';
                  } else if (val != pass.text) {
                    return 'Password not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextFormField(
                label: 'GMAIL',
                controller: email,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextFormField(
                label: 'PHONE',
                controller: phone,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Empty';
                  } else if (val.length != 10) {
                    return 'เลขไม่ครบ 10 หลัก';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  bool pass = formkey.currentState!.validate();
                  if (pass) {
                    sign_up();
                  }
                },
                child: Text('Register'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // This will navigate back to HomePage
                },
                child: Text('BACK', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      {required String label,
      bool obscureText = false,
      TextEditingController? controller,
      String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      validator: validator,
    );
  }
}
