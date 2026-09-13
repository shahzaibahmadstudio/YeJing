import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yejing/blocs/scan/scan_bloc.dart';
import 'package:yejing/blocs/scan/scan_event.dart';
import 'package:yejing/l10n/l10n_extension.dart';
import 'package:yejing/utils/constants.dart';

class ScanErrorWidget extends StatelessWidget {
  final String message;

  const ScanErrorWidget({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.s(24),
        vertical: context.s(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.scanTitle,
            style: YeJingTextStyles.n24.copyWith(
              fontSize: context.sp(24),
              color: YeJingColors.pureBlack,
            ),
          ),
          SizedBox(height: context.s(64)),
          Center(
            child: Column(
              children: [
                Icon(
                  Icons.error_outline,
                  size: context.s(64),
                  color: YeJingColors.primaryRed,
                ),
                SizedBox(height: context.s(16)),
                Text(
                  context.l10n.scanErrorTitle,
                  textAlign: TextAlign.center,
                  style: YeJingTextStyles.n16.copyWith(
                    fontSize: context.sp(16),
                    fontWeight: FontWeight.w700,
                    color: YeJingColors.pureBlack,
                  ),
                ),
                SizedBox(height: context.s(4)),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: YeJingTextStyles.n14.copyWith(
                    fontSize: context.sp(14),
                    fontWeight: FontWeight.w700,
                    color: YeJingColors.pureBlackWithAlpha36,
                  ),
                ),
                SizedBox(height: context.s(24)),
                GestureDetector(
                  onTap: () =>
                      context.read<ScanBloc>().add(const ScanResetEvent()),
                  child: Container(
                    height: context.s(48),
                    padding: EdgeInsets.symmetric(horizontal: context.s(32)),
                    decoration: BoxDecoration(
                      color: YeJingColors.primaryRed,
                      borderRadius: BorderRadius.circular(context.s(12)),
                    ),
                    child: Center(
                      child: Text(
                        context.l10n.scanRetryButton,
                        style: YeJingTextStyles.n14.copyWith(
                          fontSize: context.sp(14),
                          fontWeight: FontWeight.w700,
                          color: YeJingColors.pureWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
