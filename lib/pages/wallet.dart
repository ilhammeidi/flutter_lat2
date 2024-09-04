import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:latihan2/models/transactions.dart';
import 'package:latihan2/widgets/color_palette.dart';
import 'package:latihan2/widgets/titles/title_style.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  final whiteColor = const TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    final whiteColor2 = Theme.of(context).textTheme.displayLarge?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w700
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://i.pravatar.cc/100?u=john'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Hello',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
              Text(
                'John Doe',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              )
            ]),
          ),
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Badge(
                label: Text('1'),
                largeSize: 22,
                padding: EdgeInsets.symmetric(horizontal: 8),
                backgroundColor: Colors.red,
                child: Icon(Icons.notifications_outlined, size: 32, color: Colors.white,),
              )
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                accentMain as Color,
                secondaryMain as Color,
              ]
          )
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Builder(
              builder: (context) {
                return Column(children: [
                  SizedBox(height: spacingUnit(15)),
                  Padding(
                    padding: EdgeInsets.all(spacingUnit(2)),
                    child: Text('Saldo', style: whiteColor2),
                  ),
                  Padding(
                    padding: EdgeInsets.all(spacingUnit(2)),
                    child: Text('Rp. 2.000.000.000', style: whiteColor),
                  ),
                  Padding(
                    padding: EdgeInsets.all(spacingUnit(5)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShortcutBtn(icon: Icons.send_rounded, name: 'Send'),
                        ShortcutBtn(icon: Icons.wallet, name: 'My Wallet'),
                        ShortcutBtn(icon: Icons.payment, name: 'Receive'),
                        ShortcutBtn(icon: Icons.more_horiz, name: 'More'),
                      ],
                    ),
                  ),
                ]);
              }
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: spacingUnit(5)),
                padding: EdgeInsets.all(spacingUnit(3)),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(50))
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('latest transaction'.toCapitalCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext ctx) {
                              return const AllTransaction();
                            }
                          );
                        },
                        child: Text('view all'.toCamelCase(), style: Theme.of(context).textTheme.labelSmall),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.only(bottom: spacingUnit(2)),
                          child: TransactionItem(
                            to: transactions[index].to,
                            date: transactions[index].date,
                            amount: transactions[index].amount,
                            desc: transactions[index].description
                          ),
                        );
                      },
                      itemCount: transactions.length,
                    ),
                  )
                ],),
              ),
            )
          ]
        ),
      )
    );
  }
}

class ShortcutBtn extends StatelessWidget {
  const ShortcutBtn({super.key, required this.icon, required this.name});

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 65,
          height: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryMain,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Icon(icon, color: Colors.white, size: 24,),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
          child: Text(name, style: Theme.of(context).textTheme.bodyMedium),
        )
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.to,
    required this.date,
    required this.amount,
    required this.desc
  });

  final String to;
  final String date;
  final double amount;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacingUnit(1)),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onPrimaryContainer, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryDark,
              borderRadius: const BorderRadius.all(Radius.circular(5))
            ),
            child: Text(
              to
                .split(" ")
                .map((e) => e.substring(0, 1))
                .toList()
                .join(),
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
          ),
          SizedBox(width: spacingUnit(2)),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(to, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
            Text(date, style: Theme.of(context).textTheme.bodySmall),
          ])),
          Column(children: [
            Text('-$amount)', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
            Text(desc, style: Theme.of(context).textTheme.bodySmall),
          ])
        ],
      )
    );
  }
}

class AllTransaction extends StatelessWidget {
  const AllTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: spacingUnit(5)),
      padding: EdgeInsets.all(spacingUnit(3)),
      child: Column(children: [
        Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios_new_outlined)
            ),
            Text('Transaction History', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: spacingUnit(5),),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: spacingUnit(2)),
                child: TransactionItem(
                  to: transactions[index].to,
                  date: transactions[index].date,
                  amount: transactions[index].amount,
                  desc: transactions[index].description
                ),
              );
            },
            itemCount: transactions.length,
          )
        )
      ]),
    );
  }
}