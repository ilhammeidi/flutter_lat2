import 'package:flutter/material.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class BarberMan extends StatelessWidget {
  BarberMan({super.key});

  final List<String> _name = ['John Doe', 'Jim Doe', 'Jack Doe', 'James Doe', 'Jinx Doe', 'Joe Doe'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(image: NetworkImage('https://i.pravatar.cc/200?u=${_name[index]}'))
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
              child: Text(_name[index], style: Theme.of(context).textTheme.titleLarge)
            )
          ]);
        },
        scrollDirection: Axis.horizontal,
        itemCount: _name.length,
      ),
    );
  }
}