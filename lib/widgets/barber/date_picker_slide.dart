import 'package:flutter/material.dart';
import 'package:latihan2/models/barber_data.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class DatePickerSlide extends StatefulWidget {
  const DatePickerSlide({super.key});

  @override
  State<DatePickerSlide> createState() => _DatePickerSlideState();
}

class _DatePickerSlideState extends State<DatePickerSlide> {
  int selectedDate = 8;

  void handleSelectDate(int date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 3),
            blurRadius: 5,
            spreadRadius: 10
          )
        ]
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (constext, index){
          return Padding(padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
            child: DateOption(
              date: dateData[index].date,
              day: dateData[index].day,
              selected: selectedDate == dateData[index].date,
              tapHandle: handleSelectDate,
            )
          );
        },
        itemCount: dateData.length,
      ),
    );
  }
}

class DateOption extends StatelessWidget {
  const DateOption({
    super.key,
    required this.date,
    required this.day,
    required this.selected,
    required this.tapHandle
  });

  final int date;
  final String day;
  final void Function(int) tapHandle;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    Color switchColor() {
      if (selected) {
        return Theme.of(context).colorScheme.onSurface;
      }
      return Theme.of(context).colorScheme.outline;
    }

    Color switchColorTxt() {
      if (selected) {
        return Theme.of(context).colorScheme.surface;
      }
      return Theme.of(context).colorScheme.onSurface;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: switchColor()
      ),
      child: InkWell(
        onTap: () {
          tapHandle(date);
        },
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(date.toString(), style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: switchColorTxt()
            )),
            const SizedBox(height: 2),
            Text(day, style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: switchColorTxt()
            )),
          ])
        ),
      ),
    );
  }
}