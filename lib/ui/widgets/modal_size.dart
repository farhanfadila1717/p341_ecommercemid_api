import 'package:flutter/material.dart';
import '../../shared/shared.dart';
import 'custom_flat_button.dart';

class ModalSize extends StatefulWidget {
  const ModalSize({
    Key? key,
    this.title = 'ADD TO CHART',
  }) : super(key: key);

  final String title;

  @override
  _ModalSizeState createState() => _ModalSizeState();
}

class _ModalSizeState extends State<ModalSize> {
  String _selectedSize = sizes.first;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 310,
      child: SingleChildScrollView(
        child: Column(
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
                'Selected Size',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 20)),
            Wrap(
              children: sizes
                  .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedSize = e;
                          });
                        },
                        child: AnimatedContainer(
                          height: 39,
                          width: 100,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: _selectedSize == e
                                ? theme.primaryColor
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[100] ?? Colors.grey,
                                offset: Offset(0, 4),
                                blurRadius: 10,
                              )
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                          ),
                          child: Center(
                            child: Text(
                              e,
                              style: TextStyle(
                                color: _selectedSize == e
                                    ? Colors.white
                                    : blackColor,
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              spacing: 10,
              runSpacing: 10,
            ),
            const Padding(padding: const EdgeInsets.only(top: 16)),
            ListTile(
              onTap: () {},
              title: Text('Size info'),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomFlatButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: widget.title,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
