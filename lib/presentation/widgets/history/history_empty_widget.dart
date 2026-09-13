import 'package:flutter/material.dart';
import 'package:yejing/l10n/l10n_extension.dart';
import 'package:yejing/utils/constants.dart';

class HistoryEmptyWidget extends StatelessWidget {
  const HistoryEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              YeJingImages.leaf,
              height: context.s(120),
              width: context.s(120),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: context.s(24)),
          Text(
            context.l10n.historyEmptyTitle,
            style: YeJingTextStyles.n16.copyWith(
              fontSize: context.sp(16),
              fontWeight: FontWeight.w700,
              color: YeJingColors.pureBlackWithAlpha36,
            ),
          ),
          Text(
            context.l10n.historyEmptySubtitle,
            style: YeJingTextStyles.n16.copyWith(
              fontSize: context.sp(16),
              fontWeight: FontWeight.w700,
              color: YeJingColors.pureBlackWithAlpha36,
            ),
          ),
        ],
      ),
    );
  }
}
