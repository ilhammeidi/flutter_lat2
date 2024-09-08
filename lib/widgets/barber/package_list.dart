import 'package:flutter/material.dart';
import 'package:latihan2/models/barber_data.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class PackageList extends StatefulWidget {
  const PackageList({super.key});
  
  @override
  State<PackageList> createState() => _PackageListState();
}

class _PackageListState extends State<PackageList> {
  List selectedServices = <String>[];
  void handleSelectedServices(String package) {
    if (selectedServices.contains(package)) {
      selectedServices.remove(package);
    } else {
      selectedServices.add(package);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(spacingUnit(3)),
      child: Wrap(alignment: WrapAlignment.center, children: [
        for(int i=0; i< packageData.length; i++)
          PackageTag(
            isSelected: selectedServices.contains(packageData[i].package),
            package: packageData[i].package,
            price: packageData[i].price,
            handleSelect: handleSelectedServices
          )
      ])
    );
  }
}

class PackageTag extends StatelessWidget {
  const PackageTag({
    super.key,
    required this.isSelected,
    required this.package,
    required this.price,
    required this.handleSelect
  });

  final bool isSelected;
  final String package;
  final double price;
  final void Function(String) handleSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () {
          handleSelect(package);
        },
        child: Chip(
          backgroundColor: isSelected ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.surfaceContainerLowest,
          side: BorderSide(width: 1, color: Theme.of(context).colorScheme.onSurface),
          label: Text(
            '$package Rp $price',
            style: TextStyle(color: isSelected 
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.onSurface
            )
          )
        ),
      ),
    );
  }
}