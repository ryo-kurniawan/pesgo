import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features/home/data/models/product_model.dart';

class EditTicketDialog extends StatelessWidget {
  final ProductModel item;
  const EditTicketDialog({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: item.productName);
    final priceController = TextEditingController(text: '${item.price}');

    int parseCurrency(String text) =>
        int.tryParse(text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

    priceController.text = parseCurrency(priceController.text).currencyFormatRp;

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            const SpaceHeight(8.0),
            CustomTextField(
              controller: nameController,
              label: 'Name',
            ),
            const SpaceHeight(8.0),
            CustomTextField(
              controller: priceController,
              label: 'Harga',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final parsedValue = parseCurrency(value).currencyFormatRp;
                priceController.value = TextEditingValue(
                  text: parsedValue,
                  selection:
                      TextSelection.collapsed(offset: parsedValue.length),
                );
              },
            ),
            const SpaceHeight(40.0),
            Row(
              children: [
                Flexible(
                  child: Button.filled(
                    onPressed: () => context.pop(),
                    label: 'Batalkan',
                    borderRadius: 8.0,
                    color: AppColors.buttonCancel,
                    textColor: AppColors.grey,
                  ),
                ),
                const SpaceWidth(40.0),
                Flexible(
                  child: Button.filled(
                    onPressed: () => context.pop(),
                    label: 'Simpan',
                    borderRadius: 8.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
