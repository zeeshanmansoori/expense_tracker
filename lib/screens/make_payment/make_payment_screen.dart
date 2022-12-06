import 'package:expense_tracker/cubits/home/home_cubit.dart';
import 'package:expense_tracker/screens/bottom_navigation_screen/widgets/abstract_bottom_nav_screen.dart';
import 'package:expense_tracker/screens/home/widgets/bell_icon.dart';
import 'package:expense_tracker/screens/home/widgets/details_card.dart';
import 'package:expense_tracker/screens/home/widgets/transaction_list.dart';
import 'package:expense_tracker/screens/make_payment/widgets/action_fab.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/common_utils.dart';
import 'package:expense_tracker/utils/expense_tracker_icons.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakePaymentScreen extends StatelessWidget {
  static const routeName = "/MakePaymentScreen";

  const MakePaymentScreen({Key? key}) : super(key: key);

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                    const Text(
                      "Make Payment",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 48,
                    ),
                  ],
                ).paddingForOnly(
                  left: 20,
                  right: 20,
                  top: 30,
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Amount",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: CustomColors.dimGray,
                        ),
                      ).paddingForOnly(top: 20),
                      const TextField(
                        keyboardType: TextInputType.numberWithOptions(signed: false,decimal: true),
                        maxLines: 1,
                      ).paddingForOnly(top: 10),
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: CustomColors.dimGray,
                        ),
                      ).paddingForOnly(top: 20),
                      const TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 2,
                        maxLines: 5,
                        decoration: InputDecoration(),
                      ).paddingForOnly(top: 10),
                      Row(
                        children: [
                          const Spacer(
                            flex: 4,
                          ),
                          ActionFab(
                            title: "Pay",
                            iconData: ExpenseTrackerIcons.qrCode,
                            fabClicked: () {},
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          ActionFab(
                            title: "Manually",
                            iconData: ExpenseTrackerIcons.send,
                            fabClicked: () {},
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                        ],
                      ).paddingForOnly(top: 20),
                    ],
                  ).paddingForAll(20),
                )
              ],
            ),
          ).paddingForOnly(top: 20)
        ],
      ),
    );
  }
}
