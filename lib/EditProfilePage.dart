import 'package:flutter/material.dart';
import 'package:project/user.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  int _selectedIndex = 2;
  TextEditingController nameController =
      TextEditingController(text: 'USER ME...');
  TextEditingController heightController =
      TextEditingController(text: '155 cm');
  TextEditingController zodiacController =
      TextEditingController(text: 'Scorpio');
  TextEditingController personalityController =
      TextEditingController(text: 'INFP');
  TextEditingController petController = TextEditingController(text: 'Cat');

  Future logout() async {
    await user.setsignin(false);
    Navigator.pushNamed(context, 'HomePage');
  }

  String bloodType = 'A';
  List<String> bloodTypes = ['A', 'B', 'AB', 'O'];

  String exerciseFrequency = 'Always';
  String smokingFrequency = 'Sometimes';
  List<String> frequencies = [
    'Always',
    'Usually',
    'Normally',
    'Often',
    'Sometimes',
    'Occasionally',
    'Seldom',
    'Never'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage('https://cdn.example.com/image.jpg'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'USER ME...',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.purple)),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'About me?',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.purple)),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 10,
                runSpacing: 20,
                children: [
                  buildIconField(Icons.female, heightController),
                  buildIconField(Icons.star, zodiacController),
                  buildIconField(Icons.face, personalityController),
                  buildIconField(Icons.pets, petController),
                  buildIconDropDown(Icons.local_hospital, bloodType, bloodTypes,
                      (newValue) => setState(() => bloodType = newValue)),
                  buildIconDropDown(
                      Icons.directions_run,
                      exerciseFrequency,
                      frequencies,
                      (newValue) =>
                          setState(() => exerciseFrequency = newValue)),
                  buildIconDropDown(
                      Icons.smoke_free,
                      smokingFrequency,
                      frequencies,
                      (newValue) =>
                          setState(() => smokingFrequency = newValue)),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple[50],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat, color: Colors.black), label: 'CHAT'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: 'SETTINGS'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
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

  Widget buildIconField(IconData icon, TextEditingController controller) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: Colors.black),
        SizedBox(width: 10),
        Container(
          width: 80,
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple)),
            ),
          ),
        )
      ],
    );
  }

  Widget buildIconDropDown(IconData icon, String currentValue,
      List<String> items, Function(String) onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: Colors.black),
        SizedBox(width: 10),
        DropdownButton<String>(
          value: currentValue,
          items: items
              .map((String value) =>
                  DropdownMenuItem<String>(value: value, child: Text(value)))
              .toList(),
          onChanged: (newValue) => onChanged(newValue!),
        )
      ],
    );
  }
}
