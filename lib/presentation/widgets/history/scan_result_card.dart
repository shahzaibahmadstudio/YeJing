import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yejing/models/disease_label.dart';
import 'package:yejing/models/scan_result.dart';
import 'package:yejing/utils/constants.dart';

class ScanResultCard extends StatelessWidget {
  final ScanResult scan;
  final VoidCallback? onTap;

  const ScanResultCard({required this.scan, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.s(84),
        padding: EdgeInsets.all(context.s(12)),
        decoration: BoxDecoration(
          color: YeJingColors.pureWhite,
          borderRadius: BorderRadius.circular(context.s(12)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(context.s(12)),
              child: Image.file(
                File(scan.imagePath),
                height: context.s(64),
                width: context.s(64),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: context.s(16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    scan.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: YeJingTextStyles.n16.copyWith(
                      fontSize: context.sp(16),
                      fontWeight: FontWeight.w700,
                      color: YeJingColors.pureBlack,
                    ),
                  ),
                  SizedBox(height: context.s(4)),
                  Text(
                    DateFormat('yyyy-MM-dd').format(scan.date),
                    style: YeJingTextStyles.n12.copyWith(
                      fontSize: context.sp(12),
                      fontWeight: FontWeight.w700,
                      color: YeJingColors.pureBlackWithAlpha72,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: context.s(8)),
            Container(
              height: context.s(24),
              padding: EdgeInsets.symmetric(horizontal: context.s(10)),
              decoration: BoxDecoration(
                color: scan.severity.color,
                borderRadius: BorderRadius.circular(context.s(12)),
              ),
              child: Center(
                child: Text(
                  scan.severity.displayName,
                  style: YeJingTextStyles.n12.copyWith(
                    fontSize: context.sp(12),
                    fontWeight: FontWeight.w900,
                    color: YeJingColors.pureWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
