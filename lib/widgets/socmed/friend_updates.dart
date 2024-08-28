import 'package:flutter/material.dart';

class AvatarStatus extends StatelessWidget {
  const AvatarStatus({
    super.key,
    required this.name,
    this.isMe = false,
    this.isLive = false,
  });

  final String name;
  final bool isMe;
  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Stack(
            alignment: isLive ? Alignment.bottomCenter : Alignment.bottomRight,
            children: [
              Container(
                width: 83,
                height: 83,
                padding: const EdgeInsets.all(3),
                decoration: isMe ? const BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blue, Colors.yellow], begin: Alignment.bottomLeft, end: Alignment.topRight),
                  shape: BoxShape.circle,
                ) : null,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/100?u=$name'),
                ),
              ),
              if (!isMe)
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    child: Icon(Icons.add, size: 20, color: Theme.of(context).colorScheme.surface),
                  ),
                ),
              if(isLive)
                Container(
                  height: 16,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'LIVE',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)
                  ),
                )
            ],
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
        return AvatarStatus(name: friends[index], isMe: index == 0, isLive: index == 1);
      },
      itemCount: friends.length,
    );
  }
}