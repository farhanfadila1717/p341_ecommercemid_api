import 'package:flutter/material.dart';
import '../../../shared/shared.dart';
import '../../../models/models.dart';
import '../../widgets/widgets.dart';
import '../detail_product_page/detail_product_page.dart';
import '../filter_page/filter_page.dart';

part 'components/card_product_catalog.dart';
part 'components/chips.dart';
part 'components/option.dart';
part 'components/sortby.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
        bottom: PreferredSize(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(title, style: titleStyle),
                ),
                const Padding(padding: const EdgeInsets.only(top: 16)),
                Chips(),
                const Padding(padding: const EdgeInsets.only(top: 10)),
                Option(),
              ],
            ),
            preferredSize: Size(double.infinity, 150)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemBuilder: (BuildContext context, int index) {
          final ProductModel item = newProduct[index];
          return CardProductCatalogOne(item: item);
        },
        itemCount: newProduct.length,
      ),
      floatingActionButton: SizedBox(
        height: 45,
        child: CustomFlatButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CatalogPageTwo(
                  title: title,
                ),
              ),
            );
          },
          title: 'Catalog 2',
        ),
      ),
    );
  }
}

class CatalogPageTwo extends StatelessWidget {
  const CatalogPageTwo({Key? key, required this.title}) : super(key: key);

  final String title;

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
          title,
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
        itemCount: products1.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (BuildContext context, int index) {
          final ProductModel item = products1[index];
          return CardProduct(
            item: item,
            theme: theme,
            isDiscount: true,
          );
        },
      ),
    );
  }
}
