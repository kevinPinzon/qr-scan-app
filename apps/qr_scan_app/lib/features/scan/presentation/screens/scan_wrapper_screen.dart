import 'package:flutter/material.dart';
import 'package:qr_scan_app/features/profile/presentation/screens/profile.dart';
import 'package:qr_scan_app/features/qr_scan_history/presentation/history.dart';
import 'package:qr_scan_app/features/scan/presentation/screens/scan.dart';

class ScanWrapperScreen extends StatefulWidget {
  const ScanWrapperScreen({super.key});

  @override
  State<ScanWrapperScreen> createState() => _ScanWrapperScreenState();
}

class _ScanWrapperScreenState extends State<ScanWrapperScreen> {
  int _selectedIndex = 1;

  final List<Widget> _screens = const [
    HistoryScreen(),
    ScanScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner), label: 'Scan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
