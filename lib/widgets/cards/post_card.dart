import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/100?u=$name')),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(name),
                )
              ),
              const Icon(Icons.more_vert)
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: Image.network('https://picsum.photos/600/300/?random=$name', fit: BoxFit.cover,),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 8),
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(width: 8),
                  Icon(Icons.send_outlined),
                  Expanded(
                    child: Opacity(opacity: 0.5, child: Text('17 hours ago', textAlign: TextAlign.end))
                  )
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text('Liked by:'),
                  Text('James Doe', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(' and '),
                  Text('3 Others', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              RichText(text: const TextSpan(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lobortis quis mauris vel placerat. Integer mollis lectus quis justo fermentum, at varius nibh molestie. ')),
              const SizedBox(height: 8),
              Opacity(
                opacity: 0.5,
                child: Text('View All', style: TextStyle(color: Theme.of(context).primaryColorDark))
              )
            ],
          ),
        ),
      ],
    );
  }
}