import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/core.dart';

class SyncDataDialog extends StatelessWidget {
  const SyncDataDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpaceHeight(40.0),
          SpinKitDualRing(
            color: AppColors.primary,
            size: 80.0,
          ),
          SpaceHeight(16.0),
          Text(
            'Sync Data',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
