import 'package:flutter/material.dart';
import 'package:yejing/utils/constants.dart';

class HistoryInterface extends StatelessWidget {
  const HistoryInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "History Interface",
        style: YeJingTextStyles.n20.copyWith(fontSize: context.sp(20)),
      ),
    );
  }
}
