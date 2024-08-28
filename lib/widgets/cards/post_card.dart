import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              Row(
                children: [
                  SvgPicture.asset('assets/socmed/icon_favorite.svg', colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn)),
                  const SizedBox(width: 8),
                  SvgPicture.asset('assets/socmed/icon_comment.svg', colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn)),
                  const SizedBox(width: 8),
                  SvgPicture.asset('assets/socmed/icon_send.svg', colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn)),
                  const Expanded(
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
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lobortis quis mauris vel placerat. Integer mollis lectus quis justo fermentum, at varius nibh molestie. '
                )
              ),
              const SizedBox(height: 8),
              Opacity(
                opacity: 0.5,
                child: Text('View All', style: Theme.of(context).textTheme.bodySmall)
              )
            ],
          ),
        ),
      ],
    );
  }
}