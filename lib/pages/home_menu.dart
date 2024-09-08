import 'package:flutter/material.dart';
import 'package:latihan2/pages/barber_shop.dart';
import 'package:latihan2/pages/cake_shop.dart';
import 'package:latihan2/pages/cleaning_home.dart';
import 'package:latihan2/pages/grocery.dart';
import 'package:latihan2/pages/socmed.dart';
import 'package:latihan2/pages/wallet.dart';
import 'package:latihan2/widgets/color_palette.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: primaryMain, title: const Text('Latihan 2', style: TextStyle(color: Colors.white),),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(child: Column(children: [
          Padding(padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: BtnStyle.btnPrimary,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const BarberShop();
                  }
                ));
              },
              child: const Text('Barber Shop')
            ),
          ),
          Padding(padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: BtnStyle.btnPrimary,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CakeShop();
                  }
                ));
              },
              child: const Text('Cake Shop')
            ),
          ),
          Padding(padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: BtnStyle.btnPrimary,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CleaningHome();
                  }
                ));
              },
              child: const Text('Cleaning Services')
            ),
          ),
          Padding(padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: BtnStyle.btnPrimary,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Grocery();
                  }
                ));
              },
              child: const Text('Grocery')
            ),
          ),
          Padding(padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: BtnStyle.btnPrimary,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Socmed();
                  }
                ));
              },
              child: const Text('Social Media')
            ),
          ),
          Padding(padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: BtnStyle.btnPrimary,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Wallet();
                  }
                ));
              },
              child: const Text('E-Wallet')
            ),
          ),
        ],),),
      ),
    );
  }
}