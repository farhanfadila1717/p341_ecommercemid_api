import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.label = 'Name',
    this.hint = 'Input your name',
    this.obscureText = false,
    this.isError = false,
    this.errorMessange = 'Error, incorect input!',
    this.type = TextInputType.name,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String label;
  final bool obscureText;

  final bool isError;
  final String errorMessange;
  final ValueChanged<String> onChanged;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(
              color: isError ? theme.primaryColor : Colors.transparent,
            ),
          ),
          child: TextField(
            controller: controller,
            onChanged: (input) => onChanged(input),
            onEditingComplete: () => onChanged(controller.text),
            onSubmitted: (input) {
              FocusScope.of(context).unfocus();
            },
            obscureText: obscureText,
            maxLines: 1,
            keyboardType: type,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              labelText: label,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              suffix: Builder(
                builder: (context) {
                  if (!obscureText) {
                    if (!isError && controller.text.length > 1) {
                      return const Icon(
                        Icons.check,
                        color: Colors.green,
                      );
                    } else if (isError && controller.text.length > 1) {
                      return Icon(
                        Icons.close,
                        color: theme.primaryColor,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ),
        Visibility(
          visible: isError,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Text(
              errorMessange,
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
