import 'package:flutter/material.dart';
import 'package:latihan2/models/cake_data.dart';
import 'package:latihan2/pages/cake_detail.dart';
import 'package:latihan2/widgets/color_palette.dart';
import 'package:latihan2/widgets/titles/title_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Text('Menu', style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.bold
            )),
          ),
          SizedBox(height: 16.h),
          TabBar(
            controller: _tabController,
            indicatorColor: primaryMain,
            labelColor: primaryMain,
            tabAlignment: TabAlignment.start,
            unselectedLabelColor: Colors.grey.shade500,
            isScrollable: true,
            dividerHeight: 0,
            padding: EdgeInsets.only(left: 16.sp),
            labelPadding: EdgeInsets.only(right: 40.sp),
            tabs: [
              Tab(child: Text('Cake Box', style: Theme.of(context).textTheme.titleLarge)),
              Tab(child: Text('Cake Sliced', style: Theme.of(context).textTheme.titleLarge)),
              Tab(child: Text('Chiffon', style: Theme.of(context).textTheme.titleLarge)),
            ]
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 100.h,
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
        padding: EdgeInsets.symmetric(vertical: 16.sp),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.sp,
            mainAxisSpacing: 8.sp,
            childAspectRatio: 0.5.sp
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
      padding: EdgeInsets.all(8.sp),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return CakeDetail(thumb: cake.thumb, price: cake.price, name: cake.name);
          }));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 1.w
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
                height: 120.h,
                width: 120.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(image: AssetImage(cake.thumb), fit: BoxFit.cover)
                )
              )
            ),
            SizedBox(height: 8.h),
            Text('Rp ${cake.price}', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: accentMain, fontWeight: FontWeight.bold)),
            Text(cake.name, style: Theme.of(context).textTheme.bodyMedium),
            Padding(padding: EdgeInsets.symmetric(vertical: 8.sp),
              child: Container(color: Colors.grey.shade200, height: 1.h)
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.shopping_basket, color: primaryMain, size: 16.sp),
                SizedBox(width: 8.w),
                Text('Buy', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryMain)),
                Expanded(child: Container()),
                Icon(Icons.remove_circle_outline, size: 16.sp, color: secondaryMain),
                SizedBox(width: 8.w),
                Text('3', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryMain)),
                SizedBox(width: 8.w),
                Icon(Icons.add_circle_outline, size: 16.sp, color: secondaryMain),
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
      height: 60.h,
      color: Colors.transparent,
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 30.h,
        decoration: BoxDecoration(
          color: secondaryLight,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          )
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            height: 20.h,
            width: MediaQuery.of(context).size.width / 2 - 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home, color: primaryMain),
                const Icon(Icons.search),
              ]
            )
          ),
          SizedBox(
            height: 20.h,
            width: MediaQuery.of(context).size.width / 2 - 20.w,
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