import 'package:flutter/material.dart';

class PaperCard extends StatelessWidget {
  const PaperCard({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.green,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Theme.of(context).colorScheme.outline, width: 1)
      ),
      child: content
    );
  }
}