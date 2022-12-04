import 'package:flutter/material.dart';

abstract class AbstractBottomNavScreen extends StatelessWidget {
  abstract final int pageIndex;

  const AbstractBottomNavScreen({super.key});
}
