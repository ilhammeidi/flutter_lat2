import 'package:flutter/material.dart';

class Socmed extends StatefulWidget {
  const Socmed({super.key});

  @override
  State<Socmed> createState() => _SocmedState();
}

class _SocmedState extends State<Socmed> {
  int _selectedIndex = 3;
  void _selectPage(int index) {
    print('index no: $index');
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Center(child: Text('Home', style: TextStyle(fontSize: 48))),
    const Center(child: Text('Search', style: TextStyle(fontSize: 48))),
    const Center(child: Text('Video', style: TextStyle(fontSize: 48))),
    const Center(child: Text('Shop', style: TextStyle(fontSize: 48))),
    const Center(child: Text('Profile', style: TextStyle(fontSize: 48))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 32,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1 ? Icons.search : Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2 ? Icons.video_call : Icons.video_call_outlined),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3 ? Icons.shop_2 : Icons.shop_2_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 4 ? Icons.person_2 : Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}