import 'package:flutter/material.dart';
import '../../../shared/shared.dart';
import '../../../models/models.dart';
import '../../widgets/widgets.dart';

class DetailOrderPage extends StatelessWidget {
  const DetailOrderPage({Key? key}) : super(key: key);
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
          'Order Details',
          style: TextStyle(color: blackColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Order No.19289013',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '07-17-2021',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tracking number: ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'IWA1378131',
                        style: TextStyle(
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                  maxLines: 1,
                ),
                Spacer(),
                Text('Delivered', style: TextStyle(color: Colors.green)),
              ],
            ),
            const Padding(padding: const EdgeInsets.only(top: 30)),
            Text(
              '${carts.length} Items',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Padding(padding: const EdgeInsets.only(top: 16)),
            Wrap(
              runSpacing: 16,
              children: carts
                  .map(
                    (e) => Container(
                      height: 110,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            child: SizedBox(
                              height: 110,
                              width: 100,
                              child: Image.asset(
                                e.product.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    e.product.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                  ),
                                  const Padding(
                                      padding: const EdgeInsets.only(top: 6)),
                                  Text(e.product.subtitle),
                                  const Padding(
                                      padding: const EdgeInsets.only(top: 6)),
                                  RichText(
                                    text: TextSpan(
                                      style: labelStyle.copyWith(
                                          fontWeight: FontWeight.normal),
                                      children: [
                                        TextSpan(
                                          text: 'Color ',
                                        ),
                                        TextSpan(
                                          text: e.color,
                                          style: TextStyle(
                                            color: blackColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '  Size ',
                                        ),
                                        TextSpan(
                                          text: e.size,
                                          style: TextStyle(
                                            color: blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    maxLines: 1,
                                  ),
                                  const Padding(
                                      padding: const EdgeInsets.only(top: 6)),
                                  Row(
                                    children: [
                                      Text(
                                        'Units: ',
                                        style: labelStyle,
                                      ),
                                      Text('1'),
                                      Spacer(),
                                      Text(
                                        '${(e.product.price - (e.product.price * (e.product.discountPercent * .01))).round()}\$',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const Padding(padding: const EdgeInsets.only(top: 30)),
            Text(
              'Order information',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 16)),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Shipping Address',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const Padding(padding: const EdgeInsets.only(left: 10)),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '3 new bridge cout, Chilo hills, CA 913311, United States',
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Payment method',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const Padding(padding: const EdgeInsets.only(left: 10)),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 50,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset('assets/icons/mastercard.png'),
                          ),
                          const Padding(
                              padding: const EdgeInsets.only(left: 10)),
                          Text(
                            '**** **** **** ${myCreditCard.first.idCard.substring(myCreditCard.first.idCard.length - 4, myCreditCard.first.idCard.length)}',
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Delivery method',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: const EdgeInsets.only(left: 10)),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'FedEx, 3 days, 15\$',
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 16)),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Discount',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const Padding(padding: const EdgeInsets.only(left: 10)),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '10%, Personal promo code',
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 16)),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Total amount',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const Padding(padding: const EdgeInsets.only(left: 10)),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '\$121',
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 20)),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: CustomOutlinedButton(
                        onTap: () {},
                        title: 'Reorder',
                        textColor: blackColor,
                      ),
                    ),
                  ),
                  const Padding(padding: const EdgeInsets.only(left: 16)),
                  Expanded(
                      child: SizedBox(
                    height: 45,
                    child: CustomFlatButton(
                      onTap: () {},
                      title: 'Leave feedback',
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
