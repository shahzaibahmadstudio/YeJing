import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yejing/cubits/history/history_cubit.dart';
import 'package:yejing/cubits/history/history_state.dart';
import 'package:yejing/l10n/l10n_extension.dart';
import 'package:yejing/utils/constants.dart';
import 'package:yejing/presentation/widgets/history/history_empty_widget.dart';
import 'package:yejing/presentation/widgets/history/history_filter_bar.dart';
import 'package:yejing/presentation/widgets/history/scan_result_card.dart';

class HistoryInterface extends StatelessWidget {
  const HistoryInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.s(24),
            vertical: context.s(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.historyTitle,
                style: YeJingTextStyles.n24.copyWith(
                  fontSize: context.sp(24),
                  color: YeJingColors.pureBlack,
                ),
              ),
              SizedBox(height: context.s(4)),
              Text(
                context.l10n.historyRecordsCount(state.filteredScans.length),
                style: YeJingTextStyles.n16.copyWith(
                  fontSize: context.sp(16),
                  fontWeight: FontWeight.w700,
                  color: YeJingColors.pureBlackWithAlpha36,
                ),
              ),
              SizedBox(height: context.s(36)),
              const HistoryFilterBar(),
              Expanded(child: _buildBody(context, state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, HistoryState state) {
    if (state.scans.isEmpty) {
      return const HistoryEmptyWidget();
    }

    if (state.filteredScans.isEmpty) {
      return Center(
        child: Text(
          context.l10n.historyNoResults,
          style: YeJingTextStyles.n16.copyWith(
            fontSize: context.sp(16),
            fontWeight: FontWeight.w700,
            color: YeJingColors.pureBlackWithAlpha36,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: context.s(16)),
      itemCount: state.filteredScans.length,
      separatorBuilder: (_, _) => SizedBox(height: context.s(12)),
      itemBuilder: (context, index) {
        return ScanResultCard(scan: state.filteredScans[index]);
      },
    );
  }
}
