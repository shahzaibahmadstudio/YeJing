import 'package:flutter/material.dart';
import 'package:yejing/utils/constants.dart';

class ScanInterface extends StatelessWidget {
  const ScanInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Scan Interface",
        style: YeJingTextStyles.n20.copyWith(fontSize: context.sp(20)),
      ),
    );
  }
}
