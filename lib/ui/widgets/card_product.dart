import 'package:flutter/material.dart';
import '../../shared/style.dart';
import '../pages/detail_product_page/detail_product_page.dart';
import '../../models/product_model.dart';
import 'modal_size.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
    required this.item,
    required this.theme,
    this.isDiscount = false,
  }) : super(key: key);

  final ProductModel item;
  final ThemeData theme;
  final bool isDiscount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailProductPage(product: item)));
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox.expand(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(item.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -18,
                      right: 5,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        elevation: 2,
                        mini: true,
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
                              return ModalSize(
                                title: 'ADD TO FAVORITE',
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Visibility(
                            visible: item.isLiked,
                            child:
                                Icon(Icons.favorite_rounded, color: Colors.red),
                            replacement: Icon(Icons.favorite_outline_rounded,
                                color: Colors.grey),
                          ),
                        ),
                        heroTag:
                            '${item.title}${DateTime.now().microsecondsSinceEpoch} ',
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: const EdgeInsets.only(top: 10)),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    item.rating > index
                        ? Icons.star
                        : Icons.star_outline_rounded,
                    color: item.rating > index ? Colors.amber : Colors.grey,
                    size: 18,
                  ),
                )..add(
                    Text(
                      '(${item.totalBuy})',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ),
              const Padding(padding: const EdgeInsets.only(top: 3)),
              Text(
                item.subtitle,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const Padding(padding: const EdgeInsets.only(top: 4)),
              Text(
                item.title,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              const Padding(padding: const EdgeInsets.only(top: 4)),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${item.price}\$ ',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                      text:
                          '${(item.price - (item.price * (item.discountPercent * .01))).round()}\$',
                      style: TextStyle(
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: isDiscount ? theme.primaryColor : Colors.black87,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                isDiscount ? '-${item.discountPercent}%' : 'NEW',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCardNew extends StatelessWidget {
  const ProductCardNew({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProductModelNew item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(item.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -17,
                      right: 2,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        mini: true,
                        elevation: 2,
                        onPressed: () {},
                        heroTag: '${item.id}${item.category}${DateTime.now()}',
                        child: Visibility(
                          visible: item.p10 == '1',
                          child:
                              Icon(Icons.favorite_rounded, color: Colors.red),
                          replacement: Icon(Icons.favorite_outline_rounded,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: const EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      int rating = int.tryParse(item.p8) ?? 0;

                      return Icon(
                        rating > index
                            ? Icons.star
                            : Icons.star_outline_rounded,
                        color: rating > index ? Colors.amber : Colors.grey,
                        size: 18,
                      );
                    })
                      ..add(
                        Text(
                          '(${item.p9})',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ),
                ],
              ),
              const Padding(padding: const EdgeInsets.only(top: 4)),
              Text(
                item.title,
                style: TextStyle(color: Colors.grey),
                maxLines: 1,
              ),
              const Padding(padding: const EdgeInsets.only(top: 4)),
              Text(
                item.subtitle,
                style: TextStyle(
                  color: blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
              const Padding(padding: const EdgeInsets.only(top: 4)),
              RichText(
                maxLines: 1,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: item.p6,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough),
                    ),
                    TextSpan(
                      text: ' (${item.p5})',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                item.p7,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
