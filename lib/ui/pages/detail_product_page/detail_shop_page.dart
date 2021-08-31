import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/services.dart';
import '../../../cubits/detail_shop/detail_shop_cubit.dart';
import '../../../shared/shared.dart';
import '../../../ui/pages/review_page/review_page.dart';
import '../../../ui/widgets/widgets.dart';
import '../../../models/models.dart';

class DetailShopPage extends StatefulWidget {
  const DetailShopPage({Key? key, required this.product}) : super(key: key);

  final ProductModelNew product;

  @override
  _DetailShopPageState createState() => _DetailShopPageState();
}

class _DetailShopPageState extends State<DetailShopPage> {
  TextEditingController _descriptionController = TextEditingController();
  final dummySize = ['S', 'M', 'L'];
  String _selectedSize = 'S';
  int _count = 1;
  bool _withPhoto = true;
  bool? _isFavorite;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return BlocProvider(
      create: (context) => DetailShopCubit()..getDetail(widget.product.id),
      child: BlocBuilder<DetailShopCubit, DetailShopState>(
          builder: (context, state) {
        if (state is SuccessGetShopDetail) {
          final detail = state.shopDetail;
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              title: Text(
                widget.product.title,
                style: TextStyle(color: blackColor),
              ),
              centerTitle: true,
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: 70,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_count > 1) {
                          setState(() {
                            _count--;
                          });
                        }
                      },
                      child: Icon(
                        Icons.remove_circle_outline_rounded,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: Text(
                        '$_count',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _count++;
                        });
                      },
                      child: Icon(
                        Icons.add_circle_outline_rounded,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: CustomFlatButton(
                          onTap: () async {
                            final result = await SubmitServices.addToCard(
                              id: detail.id,
                              quantity: _count.toString(),
                              description: _descriptionController.text,
                            );
                            if (result.isNotEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result)));
                            }
                          },
                          title: 'ADD TO CHART',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 1.1,
                        child: Image.network(
                          detail.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 8),
                          decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Text(
                            detail.p7,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          ...List.generate(dummySize.length, (index) {
                            final size = dummySize[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSize = size;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: size == _selectedSize
                                      ? theme.primaryColor
                                      : Colors.white,
                                  border: Border.all(
                                    color: size == _selectedSize
                                        ? Colors.transparent
                                        : Colors.grey,
                                  ),
                                ),
                                child: Center(
                                  child: Text(dummySize[index],
                                      style: TextStyle(
                                        color: size == _selectedSize
                                            ? Colors.white
                                            : Colors.black,
                                      )),
                                ),
                              ),
                            );
                          }),
                          Spacer(),
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            mini: true,
                            elevation: 2,
                            onPressed: () async {
                              final result = await SubmitServices.addToFavorite(
                                id: detail.id,
                                liked: _isFavorite == null
                                    ? '1'
                                    : _isFavorite!
                                        ? '1'
                                        : '0',
                              );
                              print(result);
                              if (result == '1') {
                                setState(() {
                                  _isFavorite = true;
                                });
                              } else {
                                setState(() {
                                  _isFavorite = false;
                                });
                              }
                            },
                            heroTag: '${detail.id}${DateTime.now()}',
                            child: Visibility(
                              visible: _isFavorite == null
                                  ? detail.p10
                                  : _isFavorite!,
                              child: Icon(Icons.favorite_rounded,
                                  color: Colors.red),
                              replacement: Icon(Icons.favorite_outline_rounded,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                    child: Text(
                      _selectedSize == 'S'
                          ? detail.p11a
                          : _selectedSize == 'M'
                              ? detail.p11b
                              : detail.p11c,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(detail.title, style: titleStyle),
                            const Padding(
                                padding: const EdgeInsets.only(top: 4)),
                            Text(
                              detail.subtitle,
                              style: labelStyle,
                            ),
                            const Padding(
                                padding: const EdgeInsets.only(top: 4)),
                            Row(
                              children: List.generate(5, (index) {
                                int rating = int.tryParse(detail.p8) ?? 0;

                                return Icon(
                                  rating > index
                                      ? Icons.star
                                      : Icons.star_outline_rounded,
                                  color: rating > index
                                      ? Colors.amber
                                      : Colors.grey,
                                  size: 18,
                                );
                              })
                                ..add(
                                  Text(
                                    '(${detail.p9})',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ),
                          ],
                        ),
                        Spacer(),
                        RichText(
                          maxLines: 1,
                          text: TextSpan(
                            style: titleStyle.copyWith(fontSize: 17),
                            children: [
                              TextSpan(
                                text: (_selectedSize == 'S'
                                        ? detail.p6a
                                        : _selectedSize == 'M'
                                            ? detail.p6b
                                            : detail.p6c) +
                                    '\$',
                                style: TextStyle(
                                    color: theme.primaryColor,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              TextSpan(text: ' '),
                              TextSpan(
                                text: (_selectedSize == 'S'
                                        ? detail.p5a
                                        : _selectedSize == 'M'
                                            ? detail.p5b
                                            : detail.p5c) +
                                    '\$',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Text(detail.description),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder(),
                          hintText: 'Keterangan'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Rating&Review',
                          style: titleStyle,
                        ),
                        const Padding(padding: const EdgeInsets.only(top: 20)),
                        SizedBox(
                          height: 120,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(detail.p8, style: titleStyle),
                                  const Padding(
                                      padding: const EdgeInsets.only(top: 4)),
                                  Text(
                                    '${detail.p9} Ratings',
                                    style: labelStyle,
                                  ),
                                ],
                              ),
                              const Padding(
                                  padding: const EdgeInsets.only(left: 10)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: generateStar(5),
                                          ),
                                          const Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10)),
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10)),
                                          Text(
                                            '12',
                                            style: labelStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                        padding: const EdgeInsets.only(top: 4)),
                                    SizedBox(
                                      height: 20,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: generateStar(4),
                                          ),
                                          const Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10)),
                                          Container(
                                            width: size.width * .2,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '10',
                                            style: labelStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                        padding: const EdgeInsets.only(top: 4)),
                                    SizedBox(
                                      height: 20,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: generateStar(3),
                                          ),
                                          const Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10)),
                                          Container(
                                            width: size.width * .16,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '9',
                                            style: labelStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                        padding: const EdgeInsets.only(top: 4)),
                                    SizedBox(
                                      height: 20,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: generateStar(2),
                                          ),
                                          const Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10)),
                                          Container(
                                            width: size.width * .12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '6',
                                            style: labelStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                        padding: const EdgeInsets.only(top: 4)),
                                    SizedBox(
                                      height: 20,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: generateStar(1),
                                          ),
                                          const Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10)),
                                          Container(
                                            width: size.width * .07,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '3',
                                            style: labelStyle,
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
                        const Padding(padding: const EdgeInsets.only(top: 20)),
                        Row(
                          children: [
                            Text(
                              '${detail.p9} review',
                              style: titleStyle.copyWith(fontSize: 18),
                            ),
                            Spacer(),
                            Checkbox(
                              value: _withPhoto,
                              activeColor: blackColor,
                              onChanged: (value) {
                                setState(() {
                                  _withPhoto = value ?? false;
                                });
                              },
                            ),
                            Text('With photo')
                          ],
                        ),
                        const Padding(padding: const EdgeInsets.only(top: 16)),
                        Builder(builder: (BuildContext context) {
                          return CardReview(
                              count: int.tryParse(detail.p9) ?? 0,
                              withPhoto: _withPhoto);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            child: Center(
              child: SizedBox.fromSize(
                size: Size.square(30),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      }),
    );
  }
}
