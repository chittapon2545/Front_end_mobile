import 'package:flutter/material.dart';
import 'main.dart';
import 'EditProfilePage.dart';
import 'ProfilePageSeller.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            _buildImageCard(
                'https://cdn.discordapp.com/attachments/1017105323812724868/1094260619869429781/558615ff61b8417a4b492b23b947dda9.gif?ex=654f891e&is=653d141e&hm=012d02292ae9987ec4705f630be2890c0e82436d5b023dfe41136dd092b1d9b7&'),
            _buildImageCard(
                'https://cdn.discordapp.com/attachments/1017105323812724868/1168591528273391686/1.jpg?ex=655252ab&is=653fddab&hm=2a6c89159471815a77344fb8881703eab0dde1c0fe58c55bfd0ddbb4d4605ecc&'),
            _buildImageCard(
                'https://cdn.discordapp.com/attachments/1040229055498301511/1094255075658047638/ee18a4cfaafd6449924ae902697054a8.gif?ex=654f83f4&is=653d0ef4&hm=111ab6e632362f756a3dcfee154ca006f14aba3ab437601146313ccfd1c8ff54&'),
            _buildImageCard(
                'https://cdn.discordapp.com/attachments/1040229055498301511/1072380768543846480/yande.re_1008196_sample_alisa_nikolaevna_kujou_masachika_kuze_momoko_momopoco_seifuku_suou_yuki_sweater_thighhighs_tokidoki_bosotto_roshia-go_de_dereru_tonari_no_arya-san.jpg?ex=6549c3eb&is=65374eeb&hm=102d9cc5748b3618bc924231af333bd280c97f69d7f9c4a116a7adcdfff6fab3&'),
            _buildImageCard(
                'https://cdn.discordapp.com/attachments/1040229055498301511/1070983379094360074/FB_IMG_1675412569433.jpg?ex=654de8ff&is=653b73ff&hm=1377b01e28333d2eeee0e07484ded5500454b11f9cea7e0b16da4145b0c4810c&'),
            _buildImageCard(
                'https://cdn.discordapp.com/attachments/1040229055498301511/1070983364774989845/FB_IMG_1675412662747.jpg?ex=654de8fc&is=653b73fc&hm=4f5758e1e2c7883bf17e03e4dd54a393f5d27c64f336e80fc2a699f42c85e411&'),
            _buildImageCard(
                'https://cdn.discordapp.com/attachments/1040229055498301511/1070983364556898304/FB_IMG_1675412643045.jpg?ex=654de8fc&is=653b73fc&hm=cf6568681a2eadcf48a08e81def166c57cb8622203f9c0af3bc98e7460c0e4f2&'),
            _buildImageCard(
                'https://cdn.discordapp.com/attachments/1040229055498301511/1070983363881607178/FB_IMG_1675412665398.jpg?ex=654de8fb&is=653b73fb&hm=e5aca4bf4b68ab51db98c123082a32d30427c192b22702f9aaeb1fbdbf65ae5a&'),
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
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'SETTINGS',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/homeChat');
              break;
            case 2:
              Navigator.pushNamed(context, '/editProfile');
              break;
            // Handle other cases for other indices
          }
        },
      ),
    );
  }

  Widget _buildImageCard(String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePageSeller(
              profileImageUrl: imageUrl,
              name: "Sample Name",
              description: "Sample Description",
              height: "Sample Height",
              zodiacSign: "Sample Sign",
              personalityType: "Sample Type",
              petPreference: "Sample Pet Preference",
              bloodType: "Sample Blood Type",
              frequency: "Sample Frequency",
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }


}
