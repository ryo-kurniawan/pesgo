import 'package:flutter/material.dart';

import '../../../core/core.dart';

class AddTicketDialog extends StatelessWidget {
  const AddTicketDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Nusantara', 'Mancanegara'];
    final criterias = ['Perorangan', 'Grup'];

    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final categoryNotifier = ValueNotifier(categories.first);
    final criteriaNotifier = ValueNotifier(criterias.first);

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
            const SpaceHeight(8.0),
            ValueListenableBuilder(
              valueListenable: categoryNotifier,
              builder: (context, value, _) => CustomDropdown(
                value: value,
                items: categories,
                label: 'Kategori',
                onChanged: (value) => categoryNotifier.value = value!,
              ),
            ),
            const SpaceHeight(8.0),
            ValueListenableBuilder(
              valueListenable: criteriaNotifier,
              builder: (context, value, _) => CustomDropdown(
                value: value,
                items: criterias,
                label: 'Kriteria',
                onChanged: (value) => criteriaNotifier.value = value!,
              ),
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
