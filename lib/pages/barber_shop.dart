import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latihan2/widgets/barber/barber_man.dart';
import 'package:latihan2/widgets/barber/date_picker_slide.dart';
import 'package:latihan2/widgets/barber/package_list.dart';
import 'package:latihan2/widgets/barber/time_picker_tags.dart';
import 'package:latihan2/widgets/color_palette.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class BarberShop extends StatefulWidget {
  const BarberShop({super.key});

  @override
  State<BarberShop> createState() => _BarberShopState();
}

class _BarberShopState extends State<BarberShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text('barbershop'.toUpperCase(), style: Theme.of(context).textTheme.headlineLarge),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios)
        ),
      ),
      body: Container(color: Theme.of(context).colorScheme.surfaceContainerLowest, 
        child: Column(children: [
          const SizedBox(
            width: double.infinity,
            height: 100,
            child: DatePickerSlide()
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: spacingUnit(2), horizontal: spacingUnit(2)),
            child: Text(
              'Barberking'.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge
            ),
          ),
          const PackageList(),
          Padding(padding: EdgeInsets.symmetric(vertical: spacingUnit(3)),
            child: BarberMan(),
          ),
          const TimePickerTags(),
          Padding(padding: EdgeInsets.all(spacingUnit(3)),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryMain,
                foregroundColor: Colors.white,
                minimumSize: const Size(100, 50),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              child: const Row(children: [
                FaIcon(FontAwesomeIcons.whatsapp),
                SizedBox(width: 4),
                Text('Order via Whatsapp')
              ],)
            )
          ),
        ],)
      )
    );
  }
}