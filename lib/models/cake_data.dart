class Cake {
  final int id;
  final String name;
  final double price;
  final String thumb;
  final bool favorite;
  final String subMenu;

  Cake({
    required this.id,
    required this.name,
    required this.price,
    required this.thumb,
    required this.favorite,
    required this.subMenu
  });
}

final List<Cake> cakeData = [
  Cake(
    id: 1,
    name: 'Banana Cake',
    price: 270000,
    thumb: 'assets/cake/cake1.jpg',
    favorite: false,
    subMenu: 'cake_box'
  ),
  Cake(
    id: 2,
    name: 'Orange Cake',
    price: 170000,
    thumb: 'assets/cake/cake2.jpg',
    favorite: false,
    subMenu: 'cake_box'
  ),
  Cake(
    id: 3,
    name: 'Cocho Cake',
    price: 500000,
    thumb: 'assets/cake/cake3.jpg',
    favorite: false,
    subMenu: 'cake_box'
  ),
  Cake(
    id: 4,
    name: 'Fruits Cake',
    price: 270000,
    thumb: 'assets/cake/cake4.jpg',
    favorite: true,
    subMenu: 'cake_box'
  ),
  Cake(
    id: 5,
    name: 'Vanilla Cake',
    price: 200000,
    thumb: 'assets/cake/cake5.jpg',
    favorite: false,
    subMenu: 'cake_box'
  ),
  Cake(
    id: 6,
    name: 'Mixed Cake',
    price: 530000,
    thumb: 'assets/cake/cake6.jpg',
    favorite: true,
    subMenu: 'cake_box'
  ),
  Cake(
    id: 7,
    name: 'Taro Cake',
    price: 65000,
    thumb: 'assets/cake/cake7.jpg',
    favorite: true,
    subMenu: 'cake_box'
  ),
  Cake(
    id: 8,
    name: 'Puding Cake',
    price: 300000,
    thumb: 'assets/cake/cake8.jpg',
    favorite: false,
    subMenu: 'cake_box'
  ),
  Cake(
    id: 9,
    name: 'Tiramisu Cake',
    price: 275000,
    thumb: 'assets/cake/cake9.jpg',
    favorite: false,
    subMenu: 'cake_box'
  ),
  Cake(
    id: 10,
    name: 'Sweet Cake',
    price: 300000,
    thumb: 'assets/cake/cake10.jpg',
    favorite: false,
    subMenu: 'cake_box'
  )
];