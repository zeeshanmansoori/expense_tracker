import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension CustomExtensions on Widget {
  Center wrapCenter() => Center(child: this);

  Padding paddingForAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Padding paddingWithSymmetry(
          {double vertical = 0.0, double horizontal = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  Padding paddingLTRB(double left, double top, double right, double bottom) =>
      Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  Padding paddingForOnly(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, right: right, bottom: bottom, top: top),
        child: this,
      );

  Expanded expanded({required int flex}) => Expanded(flex: flex, child: this);

  Container forBackgroundColor({Color? color}) => Container(
        color: color,
        child: this,
      );

  Container withShadow({required double radius, Color? color}) => Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(radius),
          /*boxShadow: [
        BoxShadow(offset: Offset(0, 1), blurRadius: 10, color: CustomColors.greyShadow),
      ],*/
        ),
        child: this,
      );

  InkWell asButton({required Function onTap}) => InkWell(
        onTap: onTap as void Function()?,
        child: this,
      );

  /// default thickness is 1
  Widget addDivider({
    bool divider = true,
    Color? color,
    double? thickness,
    double space = 0,
  }) {
    if (divider) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: thickness ?? 1,
            ),
          ),
        ),
        child: paddingForOnly(bottom: space),
      );
    }
    return this;
  }

  Widget addSubScript(Widget widget, {MainAxisAlignment? mainAxisAlignment}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        this,
        widget,
      ],
    );
  }
}

extension TextCustomExtensions on Text {
  Widget addCubit<C extends StateStreamable<S>, S>(
      bool Function(S, S)? buildWhen,
      {required String Function(S) getText}) {
    return BlocBuilder<C, S>(
      buildWhen: buildWhen,
      builder: (context, state) {
        return _copyWith(
          getText.call(state),
          textStyle: style,
        );
      },
    );
  }

  Text _copyWith(String data, {TextStyle? textStyle}) {
    return Text(
      data,
      style: textStyle,
    );
  }
}
