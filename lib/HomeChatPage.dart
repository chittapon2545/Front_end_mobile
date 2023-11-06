import 'package:flutter/material.dart';
import 'EditProfilePage.dart';
import 'HomePage.dart';
import 'ChatPage.dart';

class HomeChatPage extends StatefulWidget {
  @override
  _HomeChatPageState createState() => _HomeChatPageState();
}

class _HomeChatPageState extends State<HomeChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home_Chat'),
      ),
      body: ListView(
        children: [
          _buildChatItem('BEER', 'ok นะ ขอบคุณ',
              'https://cdn.discordapp.com/attachments/1040229055498301511/1052969918284447774/11d6400fc19b885c47de3c1c78deab5d.gif?ex=654cfa27&is=653a8527&hm=98da57619b2425daeaf12b243c8dbed797e1488fb220825f3ba6c2961bd1f9c4&'),
          _buildChatItem('USERNAME', '1500 ได้ไหม',
              'https://cdn.discordapp.com/attachments/1040229055498301511/1094255075658047638/ee18a4cfaafd6449924ae902697054a8.gif?ex=654f83f4&is=653d0ef4&hm=111ab6e632362f756a3dcfee154ca006f14aba3ab437601146313ccfd1c8ff54&'),
          // ... ต่อไปเพิ่มรายการอื่น ๆ
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
            case 2:
              Navigator.pushNamed(context, '/editProfile');
              break;
          }
        },
      ),
    );
  }

  Widget _buildChatItem(String name, String message, String imageUrl) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl), // Here we set the image
      ),
      title: Text(name),
      subtitle: Text(message),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(chatName: name, imageUrl: imageUrl),
          ),
        );
      },
    );
  }
}
