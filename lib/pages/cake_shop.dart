import 'package:flutter/material.dart';
import 'package:latihan2/models/cake_data.dart';
import 'package:latihan2/pages/cake_detail.dart';
import 'package:latihan2/widgets/color_palette.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class CakeShop extends StatefulWidget {
  const CakeShop({super.key});

  @override
  State<CakeShop> createState() => _CakeShopState();
}

class _CakeShopState extends State<CakeShop> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cake Shop"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined)
          )
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryMain,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.fastfood, color: Colors.white)
      ),
      bottomNavigationBar: const BottomNavMenu(),
      body: ListView(
        children: [
          SizedBox(height: spacingUnit(2)),
          Padding(
            padding: EdgeInsets.all(spacingUnit(2)),
            child: Text('Menu', style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.bold
            )),
          ),
          SizedBox(height: spacingUnit(2)),
          TabBar(
            controller: _tabController,
            indicatorColor: primaryMain,
            labelColor: primaryMain,
            tabAlignment: TabAlignment.start,
            unselectedLabelColor: Colors.grey.shade500,
            isScrollable: true,
            dividerHeight: 0,
            padding: EdgeInsets.only(left: spacingUnit(2)),
            labelPadding: EdgeInsets.only(right: spacingUnit(5)),
            tabs: [
              Tab(child: Text('Cake Box', style: Theme.of(context).textTheme.titleLarge)),
              Tab(child: Text('Cake Sliced', style: Theme.of(context).textTheme.titleLarge)),
              Tab(child: Text('Chiffon', style: Theme.of(context).textTheme.titleLarge)),
            ]
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            width: double.infinity,
            child: TabBarView(controller: _tabController, children: const [
              CakePage(),
              CakePage(),
              CakePage(),
            ],)
          ),
        ]
      )
    );
  }
}

class CakePage extends StatelessWidget {
  const CakePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.75
          ),
          itemBuilder: (context, index) {
            return _buildCard(cakeData[index], context);
          },
          itemCount: cakeData.length,
        ),
      ),
    );
  }

  Widget _buildCard(Cake cake, context) {
    return Padding(
      padding: EdgeInsets.all(spacingUnit(1)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return CakeDetail(thumb: cake.thumb, price: cake.price, name: cake.name);
          }));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 1
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 5
              )
            ]
          ),
          child: Column(children: [
            Padding(padding: EdgeInsets.all(spacingUnit(1)),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                cake.favorite ?
                  const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border, color: Colors.grey)
              ])
            ),
            Hero(
              tag: cake.thumb,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(cake.thumb), fit: BoxFit.fill)
                )
              )
            ),
            const SizedBox(height: 8),
            Text('Rp ${cake.price}', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: accentMain, fontWeight: FontWeight.bold)),
            Text(cake.name, style: Theme.of(context).textTheme.bodyMedium),
            Padding(padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
              child: Container(color: Colors.grey.shade200, height: 1)
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.shopping_basket, color: primaryMain, size: 16),
                SizedBox(width: spacingUnit(1)),
                Text('Buy', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryMain)),
                Expanded(child: Container()),
                Icon(Icons.remove_circle_outline, size: 16, color: secondaryMain),
                SizedBox(width: spacingUnit(1)),
                Text('3', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryMain)),
                SizedBox(width: spacingUnit(1)),
                Icon(Icons.add_circle_outline, size: 16, color: secondaryMain),
              ])
            )
          ])
        )
      )
    );
  }
}

class BottomNavMenu extends StatelessWidget {
  const BottomNavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      notchMargin: 10,
      height: 60,
      color: Colors.transparent,
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: secondaryLight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home, color: primaryMain),
                const Icon(Icons.search),
              ]
            )
          ),
          SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shopping_basket_outlined),
                Icon(Icons.person_outline),
              ]
            )
          )
        ])
      )
    );
  }
}