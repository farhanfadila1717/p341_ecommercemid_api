import 'package:flutter/material.dart';
import 'package:loading_card/loading_card.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../../shared/shared.dart';

part 'components/card_promo.dart';

class PromoDetailPage extends StatelessWidget {
  const PromoDetailPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<ApiReturnValue<List<DetailPromoModel>>>(
        future: ContentServices.getAllDetailPromo(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(
                    'All promo',
                    style: TextStyle(color: blackColor),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final DetailPromoModel promo =
                            snapshot.data!.data[index];

                        return CardPromo(promo: promo);
                      },
                      childCount: snapshot.data!.data.length,
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return ErrorViewPromoDetailPage();
          } else {
            return LoadingViewPromoDetailPage(size: size);
          }
        },
      ),
    );
  }
}

class ErrorViewPromoDetailPage extends StatelessWidget {
  const ErrorViewPromoDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.not_started_outlined,
          color: Colors.red,
          size: 40,
        ),
        Text(
          'Gagal mendapatkan data!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class LoadingViewPromoDetailPage extends StatelessWidget {
  const LoadingViewPromoDetailPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoadingCard(
              height: size.height * .15,
              width: size.width - 40,
              borderRadius: 16,
            ),
            const Padding(padding: const EdgeInsets.only(top: 20)),
            LoadingCard(
              height: 30,
              width: size.width * .15,
              borderRadius: 16,
            ),
            const Padding(padding: const EdgeInsets.only(top: 20)),
            LoadingCard(
              height: size.height * .15,
              width: size.width - 40,
              borderRadius: 16,
            ),
            const Padding(padding: const EdgeInsets.only(top: 20)),
            LoadingCard(
              height: 30,
              width: size.width * .15,
              borderRadius: 16,
            ),
            const Padding(padding: const EdgeInsets.only(top: 20)),
            LoadingCard(
              height: size.height * .15,
              width: size.width - 40,
              borderRadius: 16,
            ),
            const Padding(padding: const EdgeInsets.only(top: 20)),
            LoadingCard(
              height: 30,
              width: size.width * .15,
              borderRadius: 16,
            ),
            const Padding(padding: const EdgeInsets.only(top: 20)),
          ],
        ),
      ),
    );
  }
}
