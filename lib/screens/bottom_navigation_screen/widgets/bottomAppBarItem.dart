import 'package:expense_tracker/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:expense_tracker/utils/common_utils.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomAppBarItem extends StatelessWidget {
  final int pageIndex;

  const BottomAppBarItem({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BottomNavigationCubit>();
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      buildWhen: (p, c) => p.currentPageIndex != c.currentPageIndex,
      builder: (context, state) {
        if (pageIndex == 2) {
          return Container(
            height: 0,
          );
        }
        return IconButton(
            onPressed: () => cubit.onCurrentPageChanged(pageIndex),
            icon: SvgPicture.asset(
              CommonUtils.getNavIconSvgPath(pageIndex,
                  selected: state.currentPageIndex == pageIndex),
            ));
      },
    );
  }
}
