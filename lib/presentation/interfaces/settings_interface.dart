import 'package:flutter/material.dart';
import 'package:yejing/utils/constants.dart';

class SettingsInterface extends StatelessWidget {
  const SettingsInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Settings Interface",
        style: YeJingTextStyles.n20.copyWith(fontSize: context.sp(20)),
      ),
    );
  }
}
