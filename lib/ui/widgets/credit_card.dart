import 'package:flutter/material.dart';
import '../../extensions/extensions.dart';
import '../../models/models.dart';

class CreditCard extends StatelessWidget {
  const CreditCard(
      {Key? key,
      required this.card,
      this.isDefault = false,
      required this.onTap})
      : super(key: key);

  final bool isDefault;
  final PaymentMethodModel card;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    if (card.bank == Bank.visa) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 50,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/visa.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  '**** **** **** ${card.idCard.substring(card.idCard.length - 4, card.idCard.length)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Spacer(),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Credit Holder Name',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              '${card.name}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Expry Date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              '${card.experied.tomY}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-10, 0),
            child: Row(
              children: [
                Checkbox(
                  value: isDefault,
                  activeColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                  ),
                  onChanged: (_) {
                    onTap();
                  },
                ),
                Text('Use as default payment method'),
              ],
            ),
          ),
          const Padding(padding: const EdgeInsets.only(top: 20)),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                const Padding(padding: const EdgeInsets.only(top: 30)),
                Text(
                  '**** **** **** ${card.idCard.substring(card.idCard.length - 4, card.idCard.length)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Credit Holder Name',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              '${card.name}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Expry Date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              '${card.experied.tomY}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox.fromSize(
                        size: Size.square(30),
                        child: Image.asset(
                          'assets/icons/mastercard.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-10, 0),
            child: Row(
              children: [
                Checkbox(
                  value: isDefault,
                  activeColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                  ),
                  onChanged: (_) {
                    onTap();
                  },
                ),
                Text('Use as default payment method'),
              ],
            ),
          ),
          const Padding(padding: const EdgeInsets.only(top: 20)),
        ],
      );
    }
  }
}
