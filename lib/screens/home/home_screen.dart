import 'package:expense_tracker/cubits/home/home_cubit.dart';
import 'package:expense_tracker/screens/bottom_navigation_screen/widgets/abstract_bottom_nav_screen.dart';
import 'package:expense_tracker/screens/home/widgets/bell_icon.dart';
import 'package:expense_tracker/screens/home/widgets/details_card.dart';
import 'package:expense_tracker/screens/home/widgets/transaction_list.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/common_utils.dart';
import 'package:expense_tracker/utils/expense_tracker_icons.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends AbstractBottomNavScreen {
  @override
  final int pageIndex = 0;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * .25;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            CommonUtils.getImageFromAsset("home_bg"),
            height: height,
            width: width,
            fit: BoxFit.fill,
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Good morning",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Zeeshan Mansoori",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ).paddingForOnly(top: 16),
                      ],
                    ).expanded(flex: 1),
                    BellIcon(
                      onBellClicked: () {},
                    ),
                  ],
                ).paddingForOnly(
                  left: 20,
                  right: 20,
                  top: 30,
                ),
                const DetailsCard(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Transactions history",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: CustomColors.neroTextColor,
                      ),
                    ).expanded(flex: 1),
                    const Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: CustomColors.dimGray,
                      ),
                    )
                  ],
                ).paddingWithSymmetry(horizontal: 22,vertical: 20),
                const TransactionList().expanded(flex: 1)
              ],
            ),
          ).paddingForOnly(top: 20)
        ],
      ),
    );
  }
}
