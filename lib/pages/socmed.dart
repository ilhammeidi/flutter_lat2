import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/socmed/logo.svg',
          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn)
        ),
        // title: const Text('Social Media', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          SvgPicture.asset('assets/socmed/icon_add.svg', colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SvgPicture.asset('assets/socmed/icon_favorite.svg', colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset('assets/socmed/icon_send.svg', colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn),),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Column(children: [
                SizedBox(
                  height: 140,
                  child: FriendUpdates(),
                ),
                Divider(height: 1, color: Theme.of(context).colorScheme.outline),
              ])
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index){
              return const Column(
                children: [
                  PostCard(name: 'John Doe'),
                  SizedBox(height: 32)
                ],
              );
            },
            childCount: 5,
          ))
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
            icon: SvgPicture.asset('assets/socmed/icon_home.svg', colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/socmed/icon_search.svg', colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn)),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/socmed/icon_live.svg', colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn)),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/socmed/icon_store.svg', colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn)),
            label: 'Shop',
          ),
          const BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 13,
              backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=10'),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}