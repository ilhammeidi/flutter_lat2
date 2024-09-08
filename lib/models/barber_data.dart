class DateObj {
  final int date;
  final String day;

  DateObj({
    required this.date,
    required this.day
  });
}

final List<DateObj> dateData = [
  DateObj(date: 7, day: 'Sun'),
  DateObj(date: 8, day: 'Mon'),
  DateObj(date: 9, day: 'Tue'),
  DateObj(date: 10, day: 'Wed'),
  DateObj(date: 11, day: 'Thu'),
  DateObj(date: 12, day: 'Fri'),
  DateObj(date: 13, day: 'Sat'),
];

class ServicePackage {
  final String package;
  final double price;

  ServicePackage({
    required this.package,
    required this.price
  });
}

final List<ServicePackage> packageData = [
  ServicePackage(package: 'Haircut', price: 120000),
  ServicePackage(package: 'Creambath', price: 50000),
  ServicePackage(package: 'Perming', price: 100000),
  ServicePackage(package: 'Protein', price: 110000),
];