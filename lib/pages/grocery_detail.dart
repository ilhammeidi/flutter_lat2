import 'package:flutter/material.dart';
import 'package:latihan2/models/grocery_data.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class GroceryDetail extends StatefulWidget {
  const GroceryDetail({super.key, required this.product});

  final GroceryProduct product;

  @override
  State<GroceryDetail> createState() => _GroceryDetailState();
}

class _GroceryDetailState extends State<GroceryDetail> {
  int count = 1;

  void addCount() {
    setState(() {
      count = count + 1;
    });
  }

  void removeCount() {
    setState(() {
      if (count <= 0) {
        count = count - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios)
        ),
        title: const Text('Item Detail'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.product.name, textAlign: TextAlign.center, style: TitleStyle.titlePrimary.copyWith(color: Colors.green)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Center(
              child: Hero(
                tag: widget.product.thumb,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.product.thumb),
                      fit: BoxFit.contain,
                    )
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Text('Rp ${widget.product.price}', style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),),
                Text('/${widget.product.quantity}', style: const TextStyle(fontSize: 14, color: Colors.green, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Text(
                widget.product.desc,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.amber),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            )
          ),
          Container(
            padding: EdgeInsets.all(spacing(2)),
            color: Colors.green[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {addCount();}, icon: Icon(Icons.add_circle_outline, size: 30, color: Theme.of(context).colorScheme.onSurface)),
                    Text(count.toString(), style: Theme.of(context).textTheme.titleMedium),
                    IconButton(onPressed: () {removeCount();}, icon: Icon(Icons.remove_circle_outline, size: 30, color: Theme.of(context).colorScheme.onSurface))
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: BtnStyle.btnPrimary,
                    child: const Text('Add to cart'),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}