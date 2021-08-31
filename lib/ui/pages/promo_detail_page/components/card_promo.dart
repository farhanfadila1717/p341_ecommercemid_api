part of '../promo_detail_page.dart';

class CardPromo extends StatefulWidget {
  const CardPromo({Key? key, required this.promo}) : super(key: key);

  final DetailPromoModel promo;

  @override
  _CardPromoState createState() => _CardPromoState();
}

class _CardPromoState extends State<CardPromo> {
  TextEditingController _noteController = TextEditingController();
  int _count = 1;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: SizedBox(
              height: 170,
              width: double.infinity,
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Image.network(
                      widget.promo.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          Colors.black87,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: SizedBox.expand(),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Row(
                        children: [
                          Text(
                            widget.promo.quantity,
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                          const Padding(
                              padding: const EdgeInsets.only(left: 5)),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Row(
                      children: [
                        Icon(Icons.assistant_photo_sharp,
                            color: Colors.white, size: 24),
                        const Padding(padding: const EdgeInsets.only(left: 6)),
                        Text(
                          widget.promo.title,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(padding: const EdgeInsets.only(top: 10)),
          RichText(
            text: TextSpan(
              style: TextStyle(
                  color: blackColor, fontSize: 18, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: widget.promo.discountPrize + ' '),
                TextSpan(
                  text: widget.promo.originalPrize,
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          const Padding(padding: const EdgeInsets.only(top: 4)),
          Text(
            widget.promo.description,
          ),
          const Padding(padding: const EdgeInsets.only(top: 10)),
          TextField(
            controller: _noteController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'example: Color Blue',
              labelText: 'Catatan',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            ),
          ),
          const Padding(padding: const EdgeInsets.only(top: 10)),
          SizedBox(
            height: 50,
            width: double.infinity,
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
                const Padding(padding: const EdgeInsets.only(left: 16)),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await SubmitServices.submitPromo(
                          _noteController.text.isNotEmpty
                              ? _noteController.text
                              : 'note',
                          _count.toString(),
                          widget.promo.id);

                      if (result.data.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(result.data),
                          ),
                        );
                      }
                    },
                    child: Text('ADD TO CART'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blueGrey[300];
                        } else {
                          return Colors.blueGrey;
                        }
                      }),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
