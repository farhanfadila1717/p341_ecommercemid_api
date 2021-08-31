part of '../home_page.dart';

class CustomListProduct extends StatelessWidget {
  const CustomListProduct({
    Key? key,
    required this.size,
    required this.theme,
    required this.items,
    this.isDiscount = false,
  }) : super(key: key);

  final Size size;
  final ThemeData theme;
  final bool isDiscount;
  final List<ProductModelNew> items;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 270,
        width: size.width,
        child: ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 20),
          itemBuilder: (context, index) {
            final ProductModelNew item = items[index];
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ProductCardNew(item: item),
            );
          },
        ),
      ),
    );
  }
}
