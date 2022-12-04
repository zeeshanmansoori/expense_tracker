import 'package:expense_tracker/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:expense_tracker/screens/bottom_navigation_screen/widgets/abstract_bottom_nav_screen.dart';
import 'package:expense_tracker/screens/bottom_navigation_screen/widgets/bottomAppBarItem.dart';
import 'package:expense_tracker/screens/bottom_navigation_screen/widgets/no_nav_screen.dart';
import 'package:expense_tracker/screens/home/home_screen.dart';
import 'package:expense_tracker/screens/profile/profile_screen.dart';
import 'package:expense_tracker/screens/statistics/statistics_screen.dart';
import 'package:expense_tracker/screens/wallet/wallet_screen.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late final BottomNavigationCubit _cubit;

  @override
  void initState() {
    _cubit = BottomNavigationCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var allScreens = const [
      HomeScreen(),
      StatisticsScreen(),
      NoNavScreen(),
      WalletScreen(),
      ProfileScreen(),
    ];

    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          buildWhen: (p, c) => p.currentPageIndex != c.currentPageIndex,
          builder: (context, state) {
            return allScreens[state.currentPageIndex];
          },
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: allScreens
                .map(
                  (data) =>
                  BottomAppBarItem(
                    pageIndex: data.pageIndex,
                  ),
            )
                .toList(),
          ).paddingWithSymmetry(vertical: 10),
        ),
        ),

    );
  }
}
