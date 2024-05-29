import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/components/delete_ticket_dialog.dart';
import '../../../../core/components/edit_ticket_dialog.dart';
import '../../../../core/core.dart';
import '../../data/models/product_model.dart';

class TicketCard extends StatelessWidget {
  final ProductModel item;
  const TicketCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName,
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      item.type,
                      style: const TextStyle(fontSize: 11.0),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const DeleteTicketDialog(),
                  );
                },
                icon: SvgPicture.asset('assets/icons/delete.svg'),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => EditTicketDialog(item: item),
                  );
                },
                icon: SvgPicture.asset('assets/icons/edit.svg'),
              ),
            ],
          ),
          const SpaceHeight(8.0),
          Text(
            item.price.currencyFormatRp,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
