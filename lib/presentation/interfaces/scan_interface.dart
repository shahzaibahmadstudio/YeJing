import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yejing/blocs/scan/scan_bloc.dart';
import 'package:yejing/blocs/scan/scan_state.dart';
import 'package:yejing/presentation/widgets/scan/scan_error_widget.dart';
import 'package:yejing/presentation/widgets/scan/scan_initial_widget.dart';
import 'package:yejing/presentation/widgets/scan/scan_loading_widget.dart';
import 'package:yejing/presentation/widgets/scan/scan_picked_widget.dart';
import 'package:yejing/presentation/widgets/scan/scan_result_widget.dart';

class ScanInterface extends StatelessWidget {
  const ScanInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ScanBloc, ScanState>(
        builder: (context, state) {
          if (state is ScanImageSelectedState) {
            return ScanPickedWidget(imageFile: state.imageFile);
          }
          if (state is ScanProcessingState) {
            return ScanLoadingWidget(imageFile: state.imageFile);
          }
          if (state is ScanResultState) {
            return ScanResultWidget(result: state.result);
          }
          if (state is ScanErrorState) {
            return ScanErrorWidget(message: state.message);
          }
          return const ScanInitialWidget();
        },
      ),
    );
  }
}
