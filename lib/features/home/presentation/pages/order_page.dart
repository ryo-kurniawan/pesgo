import 'package:flutter/material.dart';
import 'package:flutter_wisata_app/core/core.dart';

import '../../data/models/product_model.dart';

import '../widgets/order_card.dart';
import 'order_detail_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Penjualan'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: products.length,
        separatorBuilder: (context, index) => const SpaceHeight(20.0),
        itemBuilder: (context, index) => OrderCard(
          item: products[index],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
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
                    40000.currencyFormatRp,
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
                  context.push(OrderDetailPage(
                    products: [products[0], products[1]],
                  ));
                },
                label: 'Process',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
