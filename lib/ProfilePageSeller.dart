import 'package:flutter/material.dart';

class ProfilePageSeller extends StatefulWidget {
  final String profileImageUrl;
  final String name;
  final String description;
  final String height;
  final String zodiacSign;
  final String personalityType;
  final String petPreference;
  final String bloodType;
  final String frequency;

  ProfilePageSeller({
    required this.profileImageUrl,
    required this.name,
    required this.description,
    required this.height,
    required this.zodiacSign,
    required this.personalityType,
    required this.petPreference,
    required this.bloodType,
    required this.frequency,
  });

  @override
  _ProfilePageSellerState createState() => _ProfilePageSellerState();
}

class _ProfilePageSellerState extends State<ProfilePageSeller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile of ${widget.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(widget.profileImageUrl),
            ),
            SizedBox(height: 20),
            Text(
              widget.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 10,
              children: [
                Icon(Icons.female, size: 28),
                Text(widget.height,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.star, size: 28),
                Text(widget.zodiacSign,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.face, size: 28),
                Text(widget.personalityType,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.pets, size: 28),
                Text(widget.petPreference,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(widget.bloodType,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Icon(Icons.hourglass_empty, size: 28),
                Text(widget.frequency,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.brightness_3, size: 28),
                Text('Sometimes',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'BACK',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'CHAT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'SETTINGS',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/menu');
              break;
            case 1:
              Navigator.pushNamed(context, '/homeChat');
              break;
            case 2:
              Navigator.pushNamed(context, '/editProfile');
              break;
          }
        },
      ),
    );
  }
}
