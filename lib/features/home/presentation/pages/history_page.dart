import 'package:flutter/material.dart';
import 'package:flutter_wisata_app/core/core.dart';

import '../../data/models/history_model.dart';
import '../widgets/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, List<HistoryModel>> groupedHistory = {};
    for (var data in histories) {
      final monthYear =
          '${data.dateTime.toFormattedMonth()} ${data.dateTime.year}';
      if (!groupedHistory.containsKey(monthYear)) {
        groupedHistory[monthYear] = [];
      }
      groupedHistory[monthYear]!.add(data);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Transaction History'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: groupedHistory.entries.map((entry) {
          final monthYear = entry.key;
          final data = entry.value;
          final total = data.fold(
              0, (previousValue, element) => previousValue + element.price);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      monthYear,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      total.currencyFormatRp,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 3.0,
                  color: AppColors.primary,
                  endIndent: context.deviceWidth - 60.0,
                ),
                ...data.map((item) => HistoryCard(item: item)).toList(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
