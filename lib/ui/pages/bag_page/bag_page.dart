import 'package:flutter/material.dart';
import '../../../models/models.dart';
import '../../../shared/shared.dart';
import '../../widgets/widgets.dart';
import '../checkout_page/checkout_page.dart';

class BagPage extends StatelessWidget {
  const BagPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'My Bag',
                style: titleStyle,
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 16)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                children: carts
                    .map(
                      (e) => Container(
                        height: 100,
                        width: size.width - 40,
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
                              child: SizedBox.fromSize(
                                size: Size.square(100),
                                child: Image.asset(
                                  e.product.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.product.title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                            ),
                                            const Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 6)),
                                            RichText(
                                              text: TextSpan(
                                                style: labelStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.normal),
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
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.more_vert,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade200,
                                                offset: Offset(0, 3),
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            color: blackColor,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text('1'),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade200,
                                                offset: Offset(0, 3),
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: blackColor,
                                          ),
                                        ),
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
                runSpacing: 16,
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            Promo(),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Total amount',
                    style: labelStyle.copyWith(
                        fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                  Spacer(),
                  Text('124\$'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: CustomFlatButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutPage()));
                  },
                  title: 'CHECK OUT',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Promo extends StatefulWidget {
  const Promo({
    Key? key,
  }) : super(key: key);

  @override
  _PromoState createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  PromoModel? _selectedPromo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: [
          Text(
            _selectedPromo == null
                ? 'Enter your promo code'
                : _selectedPromo!.title,
            style: TextStyle(
              color: _selectedPromo == null ? Colors.grey : blackColor,
            ),
          ),
          Positioned(
            right: 0,
            child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                  ),
                  builder: (BuildContext context) {
                    return ModalPromo(
                      promo: (promo) {
                        setState(() {
                          _selectedPromo = promo;
                        });
                      },
                    );
                  },
                ).then((value) => null);
              },
              backgroundColor: blackColor,
              child: Icon(Icons.arrow_forward_rounded, color: Colors.white),
              heroTag: 'promo',
            ),
          ),
        ],
      ),
    );
  }
}

class ModalPromo extends StatelessWidget {
  const ModalPromo({
    Key? key,
    required this.promo,
  }) : super(key: key);

  final ValueChanged<PromoModel> promo;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      child: SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: 100,
                      height: 5,
                      child: const DecoratedBox(
                          decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                    ),
                  ),
                ),
                const Padding(padding: const EdgeInsets.only(top: 16)),
                Container(
                  height: 45,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        'Enter your promo code',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          backgroundColor: blackColor,
                          child: Icon(Icons.arrow_forward_rounded,
                              color: Colors.white),
                          heroTag: 'promo',
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: const EdgeInsets.only(top: 20)),
                Text(
                  'Your Promo Codes',
                  style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Padding(padding: const EdgeInsets.only(top: 16)),
                Wrap(
                  children: promos
                      .map(
                        (e) => Container(
                          height: 80,
                          width: double.infinity,
                          color: Colors.white,
                          child: Row(
                            children: [
                              SizedBox.fromSize(
                                size: Size.square(80),
                                child: DecoratedBox(
                                  decoration: e.withImage
                                      ? BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/profile/user-profile.jpeg'),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        )
                                      : BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          color: e.color,
                                        ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${e.discount}',
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: e.withImage
                                              ? blackColor
                                              : Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '%\noff',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: e.withImage
                                              ? blackColor
                                              : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              e.title,
                                              maxLines: 1,
                                            ),
                                            const Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4)),
                                            Text(
                                              e.subtitle,
                                              style: TextStyle(fontSize: 10),
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Column(
                                          children: [
                                            Text(
                                              '${e.days} days remaining',
                                              style: labelStyle,
                                            ),
                                            const Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4)),
                                            SizedBox(
                                              height: 35,
                                              width: 100,
                                              child: CustomFlatButton(
                                                onTap: () {
                                                  promo(e);
                                                  Navigator.pop(context);
                                                },
                                                title: 'Apply',
                                              ),
                                            ),
                                          ],
                                        ),
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
                  runSpacing: 20,
                ),
                const Padding(padding: const EdgeInsets.only(top: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
