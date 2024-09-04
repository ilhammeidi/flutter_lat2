import 'package:flutter/material.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class TimePickerTags extends StatefulWidget {
  const TimePickerTags({super.key});

  @override
  State<TimePickerTags> createState() => _TimePickerTagsState();
}

class _TimePickerTagsState extends State<TimePickerTags> {
  final List<String> _availTime = ['10:00', '11:00', '12:00', '14:00', '15:00', '16:00'];

  String selectedTime = '12:00';
  void handleSelectedTime(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(spacingUnit(2)),
      child: Wrap(alignment: WrapAlignment.center,
        children: [
          for (int i=0; i<_availTime.length; i++)
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              margin: const EdgeInsets.all(4),
              width: 75,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selectedTime == _availTime[i]
                  ? Theme.of(context).colorScheme.onSurface
                  : Theme.of(context).colorScheme.outline
              ),
              child: InkWell(
                onTap: () {
                  handleSelectedTime(_availTime[i]);
                },
                child: Center(
                  child: Text(
                    _availTime[i],
                    style: TextStyle(color: selectedTime == _availTime[i]
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.onSurface
                    )
                  ),
                ),
              )
            )
        ],
      ),
    );
  }
}