import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wisata_app/core/core.dart';
import 'package:flutter_wisata_app/features/home/presentation/widgets/nav_item.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../auth/data/datasources/auth_local_datasource.dart';
import '../../../auth/presentation/pages/login_page.dart';
import 'history_page.dart';
import 'home_page.dart';
import 'order_page.dart';
import 'setting_page.dart';
import 'ticket_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _pages = [
    const OrderPage(),
    const TicketPage(),
    const HistoryPage(),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -2),
                blurRadius: 30.0,
                blurStyle: BlurStyle.outer,
                spreadRadius: 0,
                color: AppColors.black.withOpacity(0.08),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              iconPath: 'assets/icons/nav/home.svg',
              label: 'Home',
              isActive: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            NavItem(
              iconPath: 'assets/icons/nav/ticket.svg',
              label: 'Ticket',
              isActive: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            const SpaceWidth(10.0),
            NavItem(
              iconPath: 'assets/icons/nav/history.svg',
              label: 'History',
              isActive: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
            NavItem(
              iconPath: 'assets/icons/nav/setting.svg',
              label: 'Setting',
              isActive: _selectedIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
