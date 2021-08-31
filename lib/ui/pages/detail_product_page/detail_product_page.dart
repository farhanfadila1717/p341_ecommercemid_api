import 'package:flutter/material.dart';
import '../../pages/review_page/review_page.dart';
import '../../../shared/shared.dart';
import '../../../models/models.dart';
import '../../widgets/widgets.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  String _selectedColorText = colorsText.first;
  bool _isLiked = false;
  Widget _likeWidget = Icon(Icons.favorite, color: Colors.red);
  Widget _unLikeWidget =
      Icon(Icons.favorite_outline_rounded, color: Colors.grey);
  late Widget _widget;

  @override
  void initState() {
    _isLiked = widget.product.isLiked;
    _widget = _isLiked ? _likeWidget : _unLikeWidget;
    super.initState();
  }

  void _liked() {
    _isLiked = !_isLiked;
    if (_isLiked) {
      _widget = _likeWidget;
    } else {
      _widget = _unLikeWidget;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.1,
              child: Image.asset(
                widget.product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16)),
                            ),
                            builder: (BuildContext context) {
                              return ModalSize();
                            },
                          );
                        },
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Size',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: const EdgeInsets.only(left: 10)),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedColorText,
                            icon: Icon(Icons.arrow_drop_down_rounded),
                            iconEnabledColor: blackColor,
                            underline: SizedBox.shrink(),
                            items: colorsText
                                .map(
                                  (e) => DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: TextStyle(color: blackColor),
                                    ),
                                    value: e,
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedColorText = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: const EdgeInsets.only(left: 10)),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 2,
                      mini: true,
                      onPressed: () {
                        _liked();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 1000),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                scale: animation, child: child);
                          },
                          child: _widget,
                        ),
                      ),
                      heroTag:
                          '${widget.product.title}${DateTime.now().microsecondsSinceEpoch} ',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('H&M', style: titleStyle),
                      const Padding(padding: const EdgeInsets.only(top: 4)),
                      Text(
                        widget.product.subtitle,
                        style: labelStyle,
                      ),
                      const Padding(padding: const EdgeInsets.only(top: 4)),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            widget.product.rating > index
                                ? Icons.star
                                : Icons.star_outline_rounded,
                            color: widget.product.rating > index
                                ? Colors.amber
                                : Colors.grey,
                            size: 18,
                          ),
                        )..add(
                            Text(
                              '(${widget.product.totalBuy})',
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
                  Text(
                    '${(widget.product.price - (widget.product.price * (widget.product.discountPercent * .01))).round()}\$',
                    style: titleStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text(widget.product.description),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReviewPage(
                              product: widget.product,
                            )));
              },
              title: Text(
                'Rating&Review',
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: CustomFlatButton(
          onTap: () {},
          title: 'ADD TO CHART',
        ),
      ),
    );
  }
}
