import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latihan2/widgets/color_palette.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class CakeDetail extends StatelessWidget {
  const CakeDetail({
    super.key, 
    required this.thumb, 
    required this.price, 
    required this.name
  });

  final String thumb;
  final double price;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 22),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
              child: Text(name, style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              )),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: spacingUnit(3)),
              child: Hero(
                tag: thumb,
                child: Container(
                  width: 250,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(thumb)
                    )
                  ),
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
              child: Center(
                child: Text('Rp $price', style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: primaryMain))
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
              child: Center(
                child: Text(
                  'Curabitur at velit nisi. Vivamus dui tortor, scelerisque sed scelerisque quis, sollicitudin eu ex. Nunc consectetur hendrerit urna. ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: BtnStyle.btnPrimary.copyWith(padding: WidgetStateProperty.all(
                      const EdgeInsets.all(10)
                    )),
                    child: const Row(children: [
                      FaIcon(FontAwesomeIcons.whatsapp),
                      SizedBox(width: 4),
                      Text('Order via Whatsspp')
                    ]),
                  ),
                )
              )
            )
          ],
        ),
      )
    );
  }
}