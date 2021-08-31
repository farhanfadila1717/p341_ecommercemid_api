part of '../categories_page.dart';

class TabBarViewItem extends StatelessWidget {
  const TabBarViewItem({Key? key, required this.categoriesItem})
      : super(key: key);

  final List<CategoriesModel> categoriesItem;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverPadding(padding: const EdgeInsets.only(top: 20)),
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SUMMER SALES',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
                const Padding(padding: const EdgeInsets.only(top: 4)),
                Text(
                  'Up to 50% off',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final CategoriesModel item = categoriesItem[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CatalogPage(
                                      title: item.title,
                                    )));
                      },
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    item.title,
                                    style: TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                item.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: categoriesItem.length,
            ),
          ),
        ),
        SliverPadding(padding: const EdgeInsets.only(top: 20)),
      ],
    );
  }
}

class TabBarViewShop extends StatefulWidget {
  const TabBarViewShop({Key? key, required this.product, this.isAll = false})
      : super(key: key);

  final bool isAll;
  final List<ProductModelNew> product;

  @override
  _TabBarViewShopState createState() => _TabBarViewShopState();
}

class _TabBarViewShopState extends State<TabBarViewShop> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Visibility(
            visible: widget.isAll,
            child: Container(
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SUMMER SALES',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                  ),
                  const Padding(padding: const EdgeInsets.only(top: 4)),
                  Text(
                    'Up to 50% off',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 10),
          sliver: SliverToBoxAdapter(
            child: Option(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 60),
          sliver: SliverGrid(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              final item = widget.product[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailShopPage(product: item)));
                },
                child: ProductCardNew(
                  item: item,
                ),
              );
            }, childCount: widget.product.length),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: .56,
            ),
          ),
        ),
      ],
    );
  }
}
