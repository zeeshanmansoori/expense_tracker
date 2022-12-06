import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key, required this.onBackPressed,}) : super(key: key);
  final void Function() onBackPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.chevron_left),
      onPressed: onBackPressed,
      color: Colors.white,
    );
  }
}
