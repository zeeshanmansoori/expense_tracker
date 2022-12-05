import 'package:flutter/material.dart';

class TextWithTrailingIcon extends StatelessWidget {
  const TextWithTrailingIcon({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        icon
      ],
    );
  }
}
