import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../../models/models.dart';
import '../../widgets/widgets.dart';

part 'components/write_review.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  bool _withPhoto = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            builder: (BuildContext context) {
              return ModalReview();
            },
          );
        },
        icon: Icon(Icons.edit),
        label: Text(
          'Write a review',
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text('4.3', style: titleStyle),
                        const Padding(padding: const EdgeInsets.only(top: 4)),
                        Text(
                          '${widget.product.totalBuy} Ratings',
                          style: labelStyle,
                        ),
                      ],
                    ),
                    const Padding(padding: const EdgeInsets.only(left: 10)),
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
                                    padding: const EdgeInsets.only(left: 10)),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const Padding(
                                    padding: const EdgeInsets.only(left: 10)),
                                Text(
                                  '12',
                                  style: labelStyle,
                                ),
                              ],
                            ),
                          ),
                          const Padding(padding: const EdgeInsets.only(top: 4)),
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: generateStar(4),
                                ),
                                const Padding(
                                    padding: const EdgeInsets.only(left: 10)),
                                Container(
                                  width: size.width * .2,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: const BorderRadius.all(
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
                          const Padding(padding: const EdgeInsets.only(top: 4)),
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: generateStar(3),
                                ),
                                const Padding(
                                    padding: const EdgeInsets.only(left: 10)),
                                Container(
                                  width: size.width * .16,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: const BorderRadius.all(
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
                          const Padding(padding: const EdgeInsets.only(top: 4)),
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: generateStar(2),
                                ),
                                const Padding(
                                    padding: const EdgeInsets.only(left: 10)),
                                Container(
                                  width: size.width * .12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: const BorderRadius.all(
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
                          const Padding(padding: const EdgeInsets.only(top: 4)),
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: generateStar(1),
                                ),
                                const Padding(
                                    padding: const EdgeInsets.only(left: 10)),
                                Container(
                                  width: size.width * .07,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: const BorderRadius.all(
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
                    '${widget.product.totalBuy} review',
                    style: titleStyle.copyWith(fontSize: 18),
                  ),
                  Spacer(),
                  Checkbox(
                    value: _withPhoto,
                    activeColor: blackColor,
                    onChanged: (value) {
                      setState(() {
                        _withPhoto = !_withPhoto;
                      });
                    },
                  ),
                  Text('With photo')
                ],
              ),
              const Padding(padding: const EdgeInsets.only(top: 16)),
              Builder(builder: (BuildContext context) {
                if (_withPhoto) {
                  return CardReview(
                    count: widget.product.totalBuy,
                    withPhoto: true,
                  );
                } else {
                  return CardReview(
                    count: widget.product.totalBuy,
                    withPhoto: false,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CardReview extends StatelessWidget {
  const CardReview({
    Key? key,
    required this.count,
    required this.withPhoto,
  }) : super(key: key);

  final int count;
  final bool withPhoto;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        count,
        (index) => SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(dummyReview.avatar),
                backgroundColor: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      dummyReview.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: const EdgeInsets.only(top: 4)),
                    generateStar(dummyReview.rating,
                        mainAxisAlignment: MainAxisAlignment.start),
                    const Padding(padding: const EdgeInsets.only(top: 4)),
                    Text(
                      dummyReview.description,
                      style: TextStyle(color: Colors.black38),
                    ),
                    Visibility(
                      visible: withPhoto,
                      child: SizedBox(
                        height: 90,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: dummyReview.imagesUrl.length,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(top: 10),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  child: Image.asset(
                                    dummyReview.imagesUrl[index],
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
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
      runSpacing: 20,
    );
  }
}

Widget generateStar(int count,
    {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.end}) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: List.generate(
        count,
        (index) => Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            )),
  );
}
