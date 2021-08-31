import 'package:flutter/material.dart';
import 'package:p341_ecommercemid_api/ui/pages/detail_product_page/detail_shop_page.dart';
import 'package:p341_ecommercemid_api/ui/widgets/widgets.dart';
import '../../../cubits/cubits.dart';
import '../../../shared/shared.dart';
import '../../../models/models.dart';
import '../../widgets/custom_flat_button.dart';
import '../catalog_page/catalog_page.dart';

part 'components/tab_bar_view_item.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyle(color: blackColor),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              icon: Icon(Icons.all_inbox),
            ),
            Tab(
              icon: Icon(Icons.food_bank),
            ),
            Tab(
              icon: Icon(Icons.fastfood),
            ),
            Tab(
              icon: Icon(Icons.star),
            ),
            Tab(
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.group),
            ),
          ],
        ),
      ),
      body: BlocBuilder<ShopCubit, ShopState>(
        builder: (BuildContext context, ShopState state) {
          if (state is SuccessGetShop) {
            return TabBarView(
              controller: _tabController,
              children: [
                TabBarViewShop(
                  isAll: true,
                  product: state.all,
                ),
                TabBarViewShop(
                  product: state.fish,
                ),
                TabBarViewShop(
                  product: state.shrimp,
                ),
                TabBarViewShop(
                  product: state.seafood,
                ),
                TabBarViewShop(
                  product: state.paket,
                ),
                TabBarViewShop(
                  product: state.mitra,
                ),
              ],
            );
          } else {
            return Center(
              child: SizedBox.fromSize(
                size: Size.square(30),
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

class CategoriesPageTwo extends StatelessWidget {
  const CategoriesPageTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          'Categories',
          style: TextStyle(color: blackColor),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: CustomFlatButton(
                onTap: () {},
                title: 'VIEW ALL ITEMS',
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Choose category',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final CategoriesModel item = categories[index];
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  title: Text(
                    item.title,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CatalogPage(
                                  title: item.title,
                                )));
                  },
                );
              },
              childCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
