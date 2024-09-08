import 'package:flutter/material.dart';
import 'package:latihan2/models/grocery_data.dart';
import 'package:latihan2/pages/grocery_detail.dart';
import 'package:latihan2/widgets/cards/product_card.dart';

class Grocery extends StatelessWidget {
  const Grocery({super.key});

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
        title: const Text('Grocery Apps'),
        centerTitle: true,
        actions: [
          Row(
            children: [
              const Icon(Icons.search),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart)
                  ),
                  Positioned(
                    top: 0,
                    right: 3,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text('2', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                      )
                    ),
                  )
                ],
              )
            ]
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 0.6
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return GroceryDetail(product: groceryData[index]);
                  })
                );
              },
              child: ProductCard(
                thumb: groceryData[index].thumb,
                price: groceryData[index].price,
                name: groceryData[index].name,
                qty: groceryData[index].quantity,
              ),
            );
          },
          itemCount: groceryData.length,
        ),
      ),
    );
  }
}