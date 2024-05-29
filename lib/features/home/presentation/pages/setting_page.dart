import 'package:flutter/material.dart';
import 'package:flutter_wisata_app/core/core.dart';

import '../../../../core/components/logout_ticket_dialog.dart';
import '../../../../core/components/sync_data_dialog.dart';
import '../widgets/setting_button.dart';
import 'setting_printer_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Setting'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(24.0),
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 24.0,
        children: [
          SettingButton(
            iconPath: 'assets/icons/settings/printer.svg',
            title: 'Printer',
            subtitle: 'kelola printer',
            onPressed: () {
              context.push(const SettingPrinterPage());
            },
          ),
          SettingButton(
            iconPath: 'assets/icons/settings/logout.svg',
            title: 'Logout',
            subtitle: 'keluar dari aplikasi',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const LogoutTicketDialog(),
              );
            },
          ),
          SettingButton(
            iconPath: 'assets/icons/settings/sync-data.svg',
            title: 'Sync Data',
            subtitle: 'sinkronasi online',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const SyncDataDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
