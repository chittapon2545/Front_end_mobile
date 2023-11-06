import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/user.dart';
import 'dart:convert';
import 'MenuPage.dart';
import 'RegisterPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    var response = await http.post(
      Uri.parse(
          'http://127.0.0.1/flutter_login/login.php'), // แก้ไข URL ตามที่ต้องการ
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    if (response.body == json.encode('Login Success')) {
      await user.setsignin(true);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPage()),
      );
    } else {
      // Handle login error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Login Error"),
            content: new Text("Invalid email or password."),
            actions: <Widget>[
              new TextButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple[100]!, Colors.purple[300]!],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.all(40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'http://cdn.discordapp.com/attachments/1126892724063326228/1171106700858773646/ce596fb3e359d98dfe9ac0a8adc8782f.jpg?ex=655b791b&is=6549041b&hm=b71f087adc9beed5ba1f384640e078a6cefb20b5ec88e7b33023bf81a8e00347&',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                'แฟนเช่า !',
                style: TextStyle(fontSize: 24, color: Colors.pink),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
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
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
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
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: login, // กำหนดการทำงานเมื่อกดปุ่ม
                child: Text('LOGIN~'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child:
                    Text('Register', style: TextStyle(color: Colors.pink[300])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
