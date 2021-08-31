import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_card/loading_card.dart';
import '../../../cubits/cubits.dart';
import '../../../models/models.dart';
import '../../widgets/widgets.dart';
import '../promo_detail_page/promo_detail_page.dart';

part 'components/custom_list.dart';
part 'components/carousel_home_page.dart';
part 'components/loading_view_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is SuccessGetProduct) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: size.height * .6,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                              image: NetworkImage(state.home.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: SizedBox.expand(),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 16,
                          width: size.width - 32,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.home.title,
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              const Padding(
                                  padding: const EdgeInsets.only(top: 16)),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      color: theme.primaryColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      child: InkWell(
                                        onTap: () {},
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        child: SizedBox(
                                          width: size.width * .3,
                                          height: 40,
                                          child: Center(
                                            child: Text(
                                              'Check',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      state.home.subtitle,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomTitleSliver(
                    title: 'New', subtitle: 'You\'re never seen it before!'),
                CustomListProduct(
                    size: size, theme: theme, items: state.newProduct),
                SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    sliver: SliverToBoxAdapter(
                        child:
                            CarouselHomePage(size: size, items: state.promo))),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 20, bottom: 16),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(state.favorite.last.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.favorite.last.title,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          const Padding(
                              padding: const EdgeInsets.only(top: 10)),
                          Text(
                            state.favorite.last.subtitle,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomTitleSliver(title: 'Sale', subtitle: 'Super summer sale'),
                CustomListProduct(
                    size: size,
                    theme: theme,
                    items: state.sale,
                    isDiscount: true),
                CustomTitleSliver(
                    title: 'Favorite',
                    subtitle: 'You\'re never seen it before!'),
                CustomListProduct(
                    size: size, theme: theme, items: state.favorite),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 20, bottom: 16),
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(
                      height: size.height - 40,
                      width: size.width,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                  image:
                                      NetworkImage(state.collection.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              alignment: Alignment.bottomRight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    state.collection.title,
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                  ),
                                  const Padding(
                                      padding: const EdgeInsets.only(top: 10)),
                                  Text(
                                    state.collection.subtitle,
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  state.summer.imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            state.summer.title,
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                              image:
                                                  NetworkImage(state.summer.p6),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            state.summer.p5,
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(state.summer.subtitle),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      state.summer.p5,
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return LoadingViewHomePage(size: size);
          }
        },
      ),
    );
  }
}
