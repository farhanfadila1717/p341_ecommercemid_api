import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../shared/shared.dart';
import '../../../models/models.dart';
import '../../widgets/widgets.dart';
import '../filter_page/filter_page.dart';
import '../detail_product_page/detail_product_page.dart';

part 'components/chips.dart';
part 'components/option.dart';
part 'components/sortby.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text('Favorites', style: titleStyle),
                ),
                const Padding(padding: const EdgeInsets.only(top: 16)),
                Chips(),
                const Padding(padding: const EdgeInsets.only(top: 10)),
                Option(),
              ],
            ),
            preferredSize: Size(double.infinity, 150)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
        backgroundColor: Colors.white,
      ),
      floatingActionButton: CustomFlatButton(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FavoritePageTwo()));
        },
        title: 'Favorite 2',
      ),
      body: ListView.builder(
        itemCount: products1.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (BuildContext context, int index) {
          final ProductModel item = products1[index];
          return CardFavoriteProductOne(
            item: item,
          );
        },
      ),
    );
  }
}

class FavoritePageTwo extends StatelessWidget {
  const FavoritePageTwo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Favorite',
          style: TextStyle(color: blackColor),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
        bottom: PreferredSize(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: const EdgeInsets.only(top: 16)),
                Chips(),
                const Padding(padding: const EdgeInsets.only(top: 10)),
                Option(),
              ],
            ),
            preferredSize: Size(double.infinity, 110)),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: .56,
        ),
        itemCount: newProduct.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (BuildContext context, int index) {
          final ProductModel item = newProduct[index];
          return CardFavoriteTwo(
            item: item,
            theme: theme,
            isDiscount: false,
          );
        },
      ),
    );
  }
}

class CardFavoriteTwo extends StatelessWidget {
  const CardFavoriteTwo({
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
                        backgroundColor: Colors.red,
                        elevation: 2,
                        mini: true,
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            FontAwesomeIcons.shoppingBag,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        heroTag: item.title + 'fav2',
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
                  style: labelStyle.copyWith(fontWeight: FontWeight.normal),
                  children: [
                    TextSpan(
                      text: 'Color ',
                    ),
                    TextSpan(
                      text: 'Blue',
                      style: TextStyle(
                        color: blackColor,
                      ),
                    ),
                    TextSpan(
                      text: '  Size ',
                    ),
                    TextSpan(
                      text: 'L',
                      style: TextStyle(
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
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

class CardFavoriteProductOne extends StatelessWidget {
  const CardFavoriteProductOne({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailProductPage(product: item)));
              },
              child: Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      height: 110,
                      width: 110,
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              item.subtitle,
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Text(
                              item.title,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            RichText(
                              text: TextSpan(
                                style: labelStyle.copyWith(
                                    fontWeight: FontWeight.normal),
                                children: [
                                  TextSpan(
                                    text: 'Color ',
                                  ),
                                  TextSpan(
                                    text: 'Blue',
                                    style: TextStyle(
                                      color: blackColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  Size ',
                                  ),
                                  TextSpan(
                                    text: 'L',
                                    style: TextStyle(
                                      color: blackColor,
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 1,
                            ),
                            Row(
                              children: [
                                Text(
                                    '${(item.price - (item.price * (item.discountPercent * .01))).round()}\$'),
                                Spacer(
                                  flex: 3,
                                ),
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => Icon(
                                      item.rating > index
                                          ? Icons.star
                                          : Icons.star_outline_rounded,
                                      color: item.rating > index
                                          ? Colors.amber
                                          : Colors.grey,
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
                                Spacer(
                                  flex: 4,
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
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: Icon(
              Icons.close_rounded,
              color: Colors.grey,
            ),
          ),
          Positioned(
            bottom: -20,
            right: 0,
            child: FloatingActionButton(
              elevation: 2,
              mini: true,
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  FontAwesomeIcons.shoppingBag,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              heroTag: item.title + 'fav',
            ),
          ),
        ],
      ),
    );
  }
}
