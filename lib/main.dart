import 'package:flutter/material.dart';
import 'package:project/check_login.dart';
import 'EditProfilePage.dart';
import 'MenuPage.dart';
import 'RegisterPage.dart';
import 'HomePage.dart';
import 'HomeChatPage.dart';
import 'ChatPage.dart';
import 'ProfilePageSeller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => check_login(),
        '/home': (context) => HomePage(),
        '/menu': (context) => MenuPage(),
        '/register': (context) => RegisterPage(),
        '/editProfile': (context) => EditProfilePage(),
        '/homeChat': (context) => HomeChatPage(),
        '/chat': (context) => ChatPage(chatName: "", imageUrl: ""),
        '/profileSeller': (context) => ProfilePageSeller(
              profileImageUrl: 'URL_TO_SELLER_IMAGE',
              name: 'Name of Seller',
              description: 'Description about the Seller',
              height: '155 cm',
              zodiacSign: 'Scorpio',
              personalityType: 'INFP',
              petPreference: 'Cat',
              bloodType: 'A',
              frequency: 'always',
            )
      },
    );
  }
}
