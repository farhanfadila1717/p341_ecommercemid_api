part of '../review_page.dart';

class ModalReview extends StatefulWidget {
  const ModalReview({
    Key? key,
  }) : super(key: key);

  @override
  _ModalReviewState createState() => _ModalReviewState();
}

class _ModalReviewState extends State<ModalReview> {
  TextEditingController _controller = TextEditingController();
  int _rating = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: 520,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: 100,
                    height: 5,
                    child: const DecoratedBox(
                        decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'What is you rate?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const Padding(padding: const EdgeInsets.only(top: 16)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _rating = index + 1;
                        });
                      },
                      child: Icon(
                        index < _rating
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        color: index < _rating ? Colors.amber : Colors.grey,
                        size: size.width * .11,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(padding: const EdgeInsets.only(top: 20)),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Please share your opinion about the product',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Padding(padding: const EdgeInsets.only(top: 16)),
              Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                  maxLength: 270,
                  maxLines: 6,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Write review...',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.camera_alt),
                      heroTag: 'addphoto',
                    ),
                    const Padding(padding: const EdgeInsets.only(top: 10)),
                    Text('Add your photo'),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: CustomFlatButton(
                    onTap: () {},
                    title: 'SEND REVIEW',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
