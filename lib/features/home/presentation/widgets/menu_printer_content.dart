import 'package:flutter/material.dart';

import '../../../../core/core.dart';

import '../../data/models/printer_model.dart';

class MenuPrinterContent extends StatelessWidget {
  final PrinterModel data;
  const MenuPrinterContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name : ${data.name}',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'macAddress: ${data.address}',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
