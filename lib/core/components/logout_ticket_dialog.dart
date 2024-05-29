import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features/auth/presentation/pages/login_page.dart';

class LogoutTicketDialog extends StatelessWidget {
  const LogoutTicketDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Logout',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpaceHeight(12.0),
          Text(
            'Apakah anda yakin untuk keluar dari aplikasi QuicTix?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.black.withOpacity(0.65),
            ),
          ),
          const SpaceHeight(20.0),
          Row(
            children: [
              Flexible(
                child: Button.filled(
                  onPressed: () => context.pop(),
                  label: 'Batalkan',
                  borderRadius: 8.0,
                  color: AppColors.buttonCancel,
                  textColor: AppColors.grey,
                  height: 44.0,
                  fontSize: 14.0,
                ),
              ),
              const SpaceWidth(12.0),
              Flexible(
                child: Button.filled(
                  onPressed: () {
                    context.pushAndRemoveUntil(
                        const LoginPage(), (route) => false);
                  },
                  label: 'Logout',
                  borderRadius: 8.0,
                  height: 44.0,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
