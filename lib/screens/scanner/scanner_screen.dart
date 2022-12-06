import 'package:expense_tracker/common_widgets/app_back_button.dart';
import 'package:expense_tracker/cubits/home/home_cubit.dart';
import 'package:expense_tracker/utils/common_utils.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatelessWidget {
  static String routeName = "/ScannerScreen";

  const ScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = MobileScannerController();

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
            create: (context) => HomeCubit(),
            child: Column(
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
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: SizedBox(
                    width: scannerWidth,
                    height: scannerWidth,
                    child: MobileScanner(
                      controller: controller,
                      allowDuplicates: false,
                      onDetect: (barcode, args) {
                        if (barcode.rawValue == null) {
                          debugPrint('zeeshan Failed to scan Barcode');
                        } else {
                          final String code = barcode.rawValue!;
                          debugPrint('zeeshan  Barcode found! $code');
                        }
                      },
                    ),
                  ),
                ).paddingForOnly(top: 20)
              ],
            ),
          ).paddingForOnly(top: 20)
        ],
      ),
    );
  }
}
