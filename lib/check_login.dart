import 'package:flutter/material.dart';
import 'package:project/HomePage.dart';
import 'package:project/MenuPage.dart';
import 'package:project/user.dart';

class check_login extends StatefulWidget {
  const check_login({super.key});

  @override
  State<check_login> createState() => _check_loginState();
}

class _check_loginState extends State<check_login> {
  Future checklogin() async {
    bool? signin = await user.getsignin();
    if (signin == false) {
      MaterialPageRoute(builder: (context) => HomePage());
    } else {
      MaterialPageRoute(builder: (context) => MenuPage());
    }
  }

  void initstate() {
    check_login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
