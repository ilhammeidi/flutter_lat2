import 'package:flutter/material.dart';
import 'package:latihan2/widgets/color_palette.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class CleaningWelcome extends StatelessWidget {
  const CleaningWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                primaryLight as Color,
                secondaryLight as Color
              ]
            )
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(spacingUnit(4)),
                child: Text('Whereas disregard', style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center),
              ),
              Padding(
                padding: EdgeInsets.all(spacingUnit(4)),
                child: Text('Rumah Sehat\nuntuk\nKehidupan yang sehat', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center)
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/cleaning/three.png'), fit: BoxFit.contain),
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.all(spacingUnit(4)),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: BtnStyle.btnPrimary,
                    child: const Text('Next')
                  ),
                )
              ),
              SizedBox(height: spacingUnit(10),)
            ],
          ),
        ),
      )
    );
  }
}