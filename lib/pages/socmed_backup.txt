import 'package:flutter/material.dart';
import 'package:latihan2/widgets/cards/post_card.dart';
import 'package:latihan2/widgets/socmed/friend_updates.dart';

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

  /* Todo
  ** - Sliver Scroll
  ** - SVG
  ** - Stack
  ** - Dark mode
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        actions: const [
          Icon(Icons.add_box_outlined, size: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.favorite_outline, size: 30),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.send_outlined, size: 30)
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 140,
            child: FriendUpdates(),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index){
                return const Column(
                  children: [
                    PostCard(name: 'John Doe'),
                    SizedBox(height: 32)
                  ],
                );
              },
              itemCount: 5,
            ),
          ),
        ]
      ),
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