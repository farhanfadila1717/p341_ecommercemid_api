import 'package:flutter/material.dart';
import '../../../models/categories_model.dart';
import '../../../shared/shared.dart';
import '../../widgets/widgets.dart';

part 'components/brand.dart';
part 'components/category.dart';
part 'components/choose_colors.dart';
part 'components/choose_size.dart';
part 'components/range_price.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          'Filter',
          style: TextStyle(color: blackColor),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Price range',
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          RangePrice(),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Colors',
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ChooseColors(),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Sizes',
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ChoseSize(),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Category',
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ChooseCategory(items: categories.sublist(1, 7)),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 16),
            sliver: SliverToBoxAdapter(
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BrandPage()));
                },
                title: Text(
                  'Brands',
                  style:
                      TextStyle(color: blackColor, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('adidas, Jack & Jones, and more'),
                trailing: Icon(Icons.chevron_right_rounded),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: CustomOutlinedButton(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'Discard',
              ),
            ),
            const Padding(padding: const EdgeInsets.only(left: 16)),
            Expanded(
              child: CustomFlatButton(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'Apply',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
