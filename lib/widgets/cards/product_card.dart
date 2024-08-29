import 'package:flutter/material.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.thumb,
    required this.price,
    required this.name,
    required this.qty,
  });

  final String thumb;
  final String name;
  final double price;
  final String qty;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.green,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Theme.of(context).colorScheme.outline, width: 1)
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Hero(
            tag: thumb,
            child: SizedBox(
              height: 150,
              child: Image.asset(thumb),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing(1)),
            child: (
              Column(children: [
                Text('Rp $price', style: const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(name, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(qty, style: Theme.of(context).textTheme.bodySmall),
              ],)
            ),
          ),
          Divider(height: 1, color: Theme.of(context).colorScheme.outline),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: (
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.add_shopping_cart, color: Colors.green),
                    SizedBox(width: 2),
                    Text('Add to cart', style: TextStyle(fontSize: 12, color: Colors.green)),
                    SizedBox(width: 8),
                    Row(
                      children: [
                        Icon(Icons.remove_circle_outline, color: Colors.green, size: 16),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text('0')),
                        Icon(Icons.add_circle_outline, color: Colors.green, size: 16),
                      ],
                    )
                  ]
                ),
              )
            )
          )
        ],
      ),
    );
  }
}