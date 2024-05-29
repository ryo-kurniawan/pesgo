import 'package:flutter/material.dart';
import 'package:flutter_wisata_app/core/core.dart';

import '../../../../core/components/payment_qris_dialog.dart';
import '../../../../core/components/payment_tunai_dialog.dart';

import '../../data/models/product_model.dart';

import '../widgets/order_detail_card.dart';
import '../widgets/payment_method_button.dart';

class OrderDetailPage extends StatelessWidget {
  final List<ProductModel> products;
  const OrderDetailPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    int paymentButtonIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Assets.images.back.image(),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: products.length,
        separatorBuilder: (context, index) => const SpaceHeight(20.0),
        itemBuilder: (context, index) => OrderDetailCard(
          item: products[index],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StatefulBuilder(
              builder: (context, setState) => Row(
                children: [
                  Expanded(
                    child: PaymentMethodButton(
                      iconPath: 'assets/icons/payment/qris.svg',
                      label: 'QRIS',
                      isActive: paymentButtonIndex == 0,
                      onPressed: () => setState(() => paymentButtonIndex = 0),
                    ),
                  ),
                  const SpaceWidth(20.0),
                  Expanded(
                    child: PaymentMethodButton(
                      iconPath: 'assets/icons/payment/tunai.svg',
                      label: 'Tunai',
                      isActive: paymentButtonIndex == 1,
                      onPressed: () => setState(() => paymentButtonIndex = 1),
                    ),
                  ),
                  const SpaceWidth(20.0),
                  Expanded(
                    child: PaymentMethodButton(
                      iconPath: 'assets/icons/payment/transfer.svg',
                      label: 'Transfer',
                      isActive: paymentButtonIndex == 2,
                      onPressed: () => setState(() => paymentButtonIndex = 2),
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(24.0),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30.0,
                    spreadRadius: 0,
                    offset: const Offset(0, -2),
                    color: AppColors.black.withOpacity(8 / 100),
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Order Summary'),
                        Text(
                          140000.currencyFormatRp,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Button.filled(
                      onPressed: () {
                        if (paymentButtonIndex == 0) {
                          showDialog(
                            context: context,
                            builder: (context) => const PaymentQrisDialog(),
                          );
                        } else if (paymentButtonIndex == 1) {
                          showDialog(
                            context: context,
                            builder: (context) => const PaymentTunaiDialog(
                              totalPrice: 140000,
                            ),
                          );
                        }
                      },
                      label: 'Process',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
