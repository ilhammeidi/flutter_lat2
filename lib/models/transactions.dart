class Transactions {
  final int id;
  final String to;
  final double amount;
  final String date;
  final String description;

  Transactions(
    this.id,
    this.to,
    this.amount,
    this.date,
    this.description
  );
}

final List<Transactions> transactions = [
  Transactions(
    1,
    'Shopee',
    350000,
    '30 Jul 2024 12:10',
    'Pulsa'
  ),
  Transactions(
    2,
    'Tokopedia',
    350000,
    '30 Jul 2024 12:10',
    'Pulsa'
  ),
  Transactions(
    3,
    'Bukalapak',
    350000,
    '30 Jul 2024 12:10',
    'Pulsa'
  ),
  Transactions(
    4,
    'Blibli',
    350000,
    '30 Jul 2024 12:10',
    'Pulsa'
  ),
  Transactions(
    5,
    'Yuk Bisnis',
    350000,
    '30 Jul 2024 12:10',
    'Pulsa'
  ),
  Transactions(
    6,
    'OYO',
    350000,
    '30 Jul 2024 12:10',
    'Pulsa'
  ),
];



