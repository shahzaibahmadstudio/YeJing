import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yejing/l10n/l10n_extension.dart';
import 'package:yejing/utils/constants.dart';

class ScanLoadingWidget extends StatelessWidget {
  final File imageFile;

  const ScanLoadingWidget({required this.imageFile, super.key});

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
          SizedBox(height: context.s(4)),
          Text(
            context.l10n.scanSubtitle,
            style: YeJingTextStyles.n16.copyWith(
              fontSize: context.sp(16),
              fontWeight: FontWeight.w700,
              color: YeJingColors.pureBlackWithAlpha36,
            ),
          ),
          SizedBox(height: context.s(36)),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(context.s(12)),
                child: Image.file(
                  imageFile,
                  height: context.s(250),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(context.s(12)),
                  child: Container(
                    color: YeJingColors.pureBlack.withAlpha(120),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: YeJingColors.pureWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.s(18)),
          Container(
            height: context.s(64),
            width: double.infinity,
            decoration: BoxDecoration(
              color: YeJingColors.pureBlackWithAlpha8,
              borderRadius: BorderRadius.circular(context.s(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.s(16),
                  width: context.s(16),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: YeJingColors.pureBlackWithAlpha36,
                  ),
                ),
                SizedBox(width: context.s(8)),
                Text(
                  context.l10n.scanAnalyzingLabel,
                  style: YeJingTextStyles.n16.copyWith(
                    fontSize: context.sp(16),
                    fontWeight: FontWeight.w900,
                    color: YeJingColors.pureBlackWithAlpha36,
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
