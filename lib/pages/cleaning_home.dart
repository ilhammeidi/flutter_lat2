import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:latihan2/widgets/color_palette.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class CleaningHome extends StatefulWidget {
  const CleaningHome({super.key});

  @override
  State<CleaningHome> createState() => _CleaningHomeState();
}

class _CleaningHomeState extends State<CleaningHome> {
  String selectType = 'clean';
  String selectFrequency = 'monthly';

  void changeType(String type) {
    setState(() {
      selectType = type;
    });
  }

  void changeFrequency(String frequency) {
    setState(() {
      selectFrequency = frequency;
    });
  }

  Column extraWidget(String img, String name, bool checked) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: primaryMain,
              backgroundImage: AssetImage(img),
            ),
            if (checked)
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  radius: 16,
                  child: Icon(Icons.check_circle, color: secondaryMain, size: 32,),
                )
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
          child: Text(name.toCapitalCase(), style: Theme.of(context).textTheme.bodyLarge),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Choose Packages',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                    colors: [
                      primaryLight as Color,
                      secondaryMain as Color
                    ]
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: ClipPath(
                        clipper: RoundedClipPath(),
                        child: Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.all(spacingUnit(2)),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              offset: const Offset(
                                0.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                            )
                          ],
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: const BorderRadius.all(Radius.circular(8))
                        ),
                      ),
                    ),
                  ]
                )
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(spacingUnit(2)),
              sliver: SliverToBoxAdapter(child: Text('Choose Package', style: Theme.of(context).textTheme.headlineMedium),)
            ),
            SliverPadding(
              padding: EdgeInsets.all(spacingUnit(2)),
              sliver: SliverToBoxAdapter(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      changeType('glowing');
                    },
                    child: BtnTCategoryThumb(
                      checked: selectType == 'glowing',
                      title: 'Glowing',
                      thumbnail: 'assets/cleaning/five.png',
                    )
                  ),
                  InkWell(
                    onTap: () {
                      changeType('clean');
                    },
                    child: BtnTCategoryThumb(
                      checked: selectType == 'clean',
                      title: 'Clean',
                      thumbnail: 'assets/cleaning/six.png',
                    )
                  )
                ],
              ))
            ),
            SliverToBoxAdapter(child: SizedBox(height: spacingUnit(2))),
            SliverPadding(
              padding: EdgeInsets.all(spacingUnit(2)),
              sliver: SliverToBoxAdapter(child: Text('choose subscribtion'.toCapitalCase(), style: Theme.of(context).textTheme.headlineMedium)),
            ),
            SliverPadding(
              padding: EdgeInsets.all(spacingUnit(2)),
              sliver: SliverToBoxAdapter(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        changeFrequency('daily');
                      },
                      child: BtnCheckFrequency(
                        title: 'daily',
                        checked: selectFrequency == 'daily'
                      )
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        changeFrequency('weekly');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: BtnCheckFrequency(
                          title: 'weekly',
                          checked: selectFrequency == 'weekly'
                        ),
                      )
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        changeFrequency('monthly');
                      },
                      child: BtnCheckFrequency(
                        title: 'monthly',
                        checked: selectFrequency == 'monthly'
                      )
                    ),
                  ),
                ]
              ),),
            ),
            SliverToBoxAdapter(child: SizedBox(height: spacingUnit(2))),
            SliverPadding(
              padding: EdgeInsets.all(spacingUnit(2)),
              sliver: SliverToBoxAdapter(child: Text('Extra Services'.toCapitalCase(), style: Theme.of(context).textTheme.headlineMedium)),
            ),
            SliverPadding(
              padding: EdgeInsets.all(spacingUnit(2)),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index ) {
                    return extraWidget('assets/cleaning/two.png', 'service 2', true);
                  },
                  childCount: 6,
                )
              ),
            ),
          ],
        ),
      )
    );
  }
}


class RoundedClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
  
    final path = Path();
    
    path.lineTo(0, h - 50);
    path.quadraticBezierTo(w * 0.5, 0, w, h - 50);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();
  
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BtnCheckFrequency extends StatelessWidget {
  const BtnCheckFrequency({
    super.key,
    required this.title,
    this.checked = false,
  });

  final String title;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: checked ? primaryMain : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: checked ? null : Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 2,
        )
      ),
      child: Text(
        title.toCapitalCase(),
        style: TextStyle(
          color: checked ? Colors.white : Theme.of(context).colorScheme.onSurface)
        ),
    ); 
  }
}

class BtnTCategoryThumb extends StatelessWidget {
  const BtnTCategoryThumb({
    super.key,
    required this.thumbnail,
    this.checked = false,
    required this.title,
  });

  final String thumbnail;
  final bool checked;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 140,
          width: MediaQuery.of(context).size.width / 2 - spacingUnit(4),
          decoration: BoxDecoration(
            color: primaryLight,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              image: AssetImage(thumbnail),
              fit: BoxFit.contain,
            )
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: spacingUnit(3)),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)
          )
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryLight
          ),
          child: checked ? 
            Icon(Icons.check_circle, color: primaryMain, size: 30) 
            : Container()
          ,
        )
      ]
    );
  }
}