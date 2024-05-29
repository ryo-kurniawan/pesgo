import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';

import '../../data/models/product_model.dart';

class OrderCard extends StatelessWidget {
  final ProductModel item;
  const OrderCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final quantityNotifier = ValueNotifier(0);
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
                child: Text(
                  item.productName,
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
              InkWell(
                onTap: () {
                  if (quantityNotifier.value > 0) {
                    quantityNotifier.value--;
                  }
                },
                child: SvgPicture.asset('assets/icons/reduce_quantity.svg'),
              ),
              ValueListenableBuilder(
                valueListenable: quantityNotifier,
                builder: (context, value, _) => Text(
                  '$value',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () => quantityNotifier.value++,
                child: SvgPicture.asset('assets/icons/add_quantity.svg'),
              ),
            ],
          ),
          Text(
            item.type,
            style: const TextStyle(fontSize: 11.0),
          ),
          const SpaceHeight(8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.price.currencyFormatRp,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ValueListenableBuilder(
                valueListenable: quantityNotifier,
                builder: (context, value, _) => Text(
                  (item.price * value).currencyFormatRp,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
