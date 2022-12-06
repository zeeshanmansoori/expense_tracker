import 'package:expense_tracker/common_widgets/app_back_button.dart';
import 'package:expense_tracker/cubits/make_payment/make_payment_cubit.dart';
import 'package:expense_tracker/screens/make_payment/widgets/action_fab.dart';
import 'package:expense_tracker/screens/scanner/scanner_screen.dart';
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
            create: (context) => MakePaymentCubit(),
            child: BlocListener<MakePaymentCubit, MakePaymentState>(
              listener: (context, state) {
                CommonUtils.showSnackBar(context, state.msg);
              },
              child: Builder(builder: (context) {
                var cubit = context.read<MakePaymentCubit>();
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBackButton(
                          onBackPressed: () => Navigator.pop(context),
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
                          TextField(
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: false,
                              decimal: true,
                            ),
                            maxLines: 1,
                            onChanged: cubit.onAmountChanged,
                          ).paddingForOnly(top: 10),
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: CustomColors.dimGray,
                            ),
                          ).paddingForOnly(top: 20),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 2,
                            maxLines: 5,
                            onChanged: cubit.onDescriptionChanged,
                          ).paddingForOnly(top: 10),
                          Row(
                            children: [
                              const Spacer(
                                flex: 4,
                              ),
                              ActionFab(
                                title: "Pay",
                                iconData: ExpenseTrackerIcons.qrCode,
                                fabClicked: () {
                                  var isValid =
                                      cubit.validateInput(displayError: true);
                                  if (isValid) {
                                    Navigator.pushNamed(
                                      context,
                                      ScannerScreen.routeName,
                                      arguments: {
                                        "amount": cubit.state.amount,
                                        "description": cubit.state.description,
                                      },
                                    );
                                  }
                                },
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
                );
              }),
            ),
          ).paddingForOnly(top: 20)
        ],
      ),
    );
  }
}
