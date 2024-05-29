import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features/home/presentation/pages/payment_success_page.dart';

class PaymentTunaiDialog extends StatefulWidget {
  final int totalPrice;
  const PaymentTunaiDialog({super.key, required this.totalPrice});

  @override
  State<PaymentTunaiDialog> createState() => _PaymentTunaiDialogState();
}

class _PaymentTunaiDialogState extends State<PaymentTunaiDialog> {
  final nominalController = TextEditingController();
  int paidIndex = -1;

  @override
  void initState() {
    nominalController.text = widget.totalPrice.currencyFormatRp;
    super.initState();
  }

  @override
  void dispose() {
    nominalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpaceHeight(12.0),
          CustomTextField(
            controller: nominalController,
            label: 'Masukkan Nominal',
          ),
          const SpaceHeight(20.0),
          Row(
            children: [
              Flexible(
                child: Button.outlined(
                  label: 'Uang Pas',
                  borderRadius: 10.0,
                  fontSize: 14.0,
                  onPressed: () => setState(() => paidIndex = 0),
                  textColor: paidIndex == 0 ? AppColors.white : AppColors.grey,
                  color:
                      paidIndex == 0 ? AppColors.primary : Colors.transparent,
                ),
              ),
              const SpaceWidth(20.0),
              Flexible(
                child: Button.outlined(
                  label: 200000.currencyFormatRp,
                  borderRadius: 10.0,
                  fontSize: 14.0,
                  onPressed: () => setState(() => paidIndex = 1),
                  textColor: paidIndex == 1 ? AppColors.white : AppColors.grey,
                  color:
                      paidIndex == 1 ? AppColors.primary : Colors.transparent,
                ),
              ),
            ],
          ),
          const SpaceHeight(20.0),
          Row(
            children: [
              Flexible(
                child: Button.outlined(
                  label: 150000.currencyFormatRp,
                  borderRadius: 10.0,
                  fontSize: 14.0,
                  onPressed: () => setState(() => paidIndex = 2),
                  textColor: paidIndex == 2 ? AppColors.white : AppColors.grey,
                  color:
                      paidIndex == 2 ? AppColors.primary : Colors.transparent,
                ),
              ),
              const SpaceWidth(20.0),
              Flexible(
                child: Button.outlined(
                  label: 300000.currencyFormatRp,
                  borderRadius: 10.0,
                  fontSize: 14.0,
                  onPressed: () => setState(() => paidIndex = 3),
                  textColor: paidIndex == 3 ? AppColors.white : AppColors.grey,
                  color:
                      paidIndex == 3 ? AppColors.primary : Colors.transparent,
                ),
              ),
            ],
          ),
          const SpaceHeight(24.0),
          Button.filled(
            disabled: paidIndex == -1,
            onPressed: () {
              context.pushReplacement(const PaymentSuccessPage());
            },
            label: 'Bayar',
            fontSize: 16.0,
            borderRadius: 10.0,
          ),
        ],
      ),
    );
  }
}
