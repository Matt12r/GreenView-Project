import 'package:flutter/material.dart';

// ignore: camel_case_types

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  homeScreenState createState() {
    return homeScreenState();
  }
}

// ignore: camel_case_types
class homeScreenState extends State<homeScreen> {
  // form key
  String _title = "";
  int _selectedIndex = 0;
  PageController pageController = PageController();
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
    switch (index) {
      case 0:
        {
          _title = 'Home';
        }
        break;
      case 1:
        {
          _title = 'News';
        }
        break;
      case 2:
        {
          _title = 'Weather';
        }
        break;
      case 3:
        {
          _title = 'Settings';
        }
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
      ),
      body: PageView(controller: pageController, children: [
        Container(),
        Container(),
        Container(),
        Container(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_outlined),
              label: 'News',
              activeIcon: Icon(Icons.note_alt_rounded)),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud_outlined),
              label: 'Weather',
              activeIcon: Icon(Icons.cloud_rounded)),
          BottomNavigationBarItem(
              icon: Icon(Icons.handyman_outlined),
              label: 'Settings',
              activeIcon: Icon(Icons.handyman_rounded))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      ),
    );
  }
}
