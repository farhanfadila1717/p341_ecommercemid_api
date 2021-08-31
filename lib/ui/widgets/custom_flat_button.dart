import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({
    Key? key,
    required this.onTap,
    this.title = 'Title',
    this.color,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(title),
      style: color == null
          ? ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            )
          : ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(color),
            ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.onTap,
    this.title = 'Title',
    this.color = Colors.white,
    this.textColor = Colors.grey,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final Color textColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(title),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                color: textColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color),
          foregroundColor: MaterialStateProperty.all(textColor),
          elevation: MaterialStateProperty.all(0)),
    );
  }
}
