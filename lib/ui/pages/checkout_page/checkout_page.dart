import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../shared/shared.dart';
import '../../../models/models.dart';
import '../../widgets/custom_flat_button.dart';
import '../payment_methods_page/payments_method_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Checkout',
          style: TextStyle(color: blackColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Jane'),
                      Spacer(),
                      Text(
                        'Change',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  const Padding(padding: const EdgeInsets.only(top: 10)),
                  Text(
                      '3 new bridge cout\nChilo hills, CA 913311, United States'),
                ],
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 40)),
            Row(
              children: [
                Text(
                  'Payment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentMethodsPage()));
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
            const Padding(padding: const EdgeInsets.only(top: 16)),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 80,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Image.asset('assets/icons/mastercard.png'),
                ),
                const Padding(padding: const EdgeInsets.only(left: 10)),
                Text(
                    '**** **** **** ${myCreditCard.first.idCard.substring(myCreditCard.first.idCard.length - 4, myCreditCard.first.idCard.length)}')
              ],
            ),
            const Padding(padding: const EdgeInsets.only(top: 40)),
            Text(
              'Delivery Method',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 16)),
            Wrap(
              children: deliverys
                  .map(
                    (e) => Container(
                      height: 70,
                      width: 100,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            e.imageUrl,
                            width: 55,
                            fit: BoxFit.fitWidth,
                          ),
                          const Padding(padding: const EdgeInsets.only(top: 5)),
                          Text(
                            e.desc,
                            style: labelStyle,
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
              spacing: 10,
            ),
            const Padding(padding: const EdgeInsets.only(top: 30)),
            Row(
              children: [
                Text(
                  'Order',
                  style: labelStyle.copyWith(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
                Spacer(),
                Text('124\$'),
              ],
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            Row(
              children: [
                Text(
                  'Delivery',
                  style: labelStyle.copyWith(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
                Spacer(),
                Text('10\$'),
              ],
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            Row(
              children: [
                Text(
                  'Summary',
                  style: labelStyle.copyWith(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
                Spacer(),
                Text('134\$'),
              ],
            ),
            const Padding(padding: const EdgeInsets.only(top: 20)),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: CustomFlatButton(
                onTap: () {},
                title: 'SUBMIT ORDER',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
