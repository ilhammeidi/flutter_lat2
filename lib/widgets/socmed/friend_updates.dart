import 'package:flutter/material.dart';

class AvatarStatus extends StatelessWidget {
  const AvatarStatus({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: 83,
            height: 83,
            padding: EdgeInsets.all(3),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.yellow], begin: Alignment.bottomLeft, end: Alignment.topRight),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://i.pravatar.cc/100?u=$name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child:Text(name)
          ),
        ]
      ),
    );
  }
}


class FriendUpdates extends StatelessWidget {
  FriendUpdates({super.key});

  final List friends = ['John Doe', 'Jean Doe', 'Jim Doe', 'Jena Doe', 'Jinx Doe', 'Jihan Doe', 'Johan Done', 'Jihan Doe'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return AvatarStatus(name: friends[index]);
      },
      itemCount: friends.length,
    );
  }
}