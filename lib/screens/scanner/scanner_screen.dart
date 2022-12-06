import 'package:expense_tracker/common_widgets/app_back_button.dart';
import 'package:expense_tracker/cubits/scanner/scanner_cubit.dart';
import 'package:expense_tracker/screens/scanner/widgets/payment_app_list_widget.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/common_utils.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:scan/scan.dart';

class ScannerScreen extends StatelessWidget {
  static String routeName = "/ScannerScreen";

  const ScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    double amount = arguments["amount"];
    String description = arguments["description"];

    ScanController controller = ScanController();
    var height = MediaQuery.of(context).size.height * .25;
    var width = MediaQuery.of(context).size.width;

    var scannerWidth = MediaQuery.of(context).size.width * .6;

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
            create: (context) => ScannerCubit(
              amount: amount,
              description: description,
            ),
            child: Builder(builder: (context) {
              var cubit = context.read<ScannerCubit>();
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBackButton(
                        onBackPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        "Scan UPI",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ).asButton(onTap: () {
                        context.read<ScannerCubit>().getAppsList();
                      }),
                      Container(
                        width: 48,
                      ),
                    ],
                  ).paddingForOnly(
                    left: 20,
                    right: 20,
                    top: 30,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      width: scannerWidth,
                      height: scannerWidth,
                      child: ScanView(
                        controller: controller,
                        scanAreaScale: 1,
                        scanLineColor: CustomColors.primaryColor,
                        onCapture: cubit.onQrCodeDetected,
                      ),
                    ),
                  ).paddingForOnly(top: 20),
                  BlocBuilder<ScannerCubit, ScannerState>(
                    buildWhen: (p, c) => p.qrCodeDetected != c.qrCodeDetected,
                    builder: (context, state) {
                      if (state.qrCodeDetected) {
                        return  PaymentAppListWidget(onAppClicked: (model){
                          cubit.makePayment(model);
                        });
                      }
                      return Container();
                    },
                  ).paddingForOnly(top: 30).expanded(flex: 1)
                ],
              );
            }),
          ).paddingForOnly(top: 20)
        ],
      ),
    );
  }
}
