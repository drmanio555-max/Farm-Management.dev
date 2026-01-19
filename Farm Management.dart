import 'package:flutter/material.dart';

void main() {
  runApp(const FarmManagerApp());
}

// ایپ کی بنیادی کلاس
class FarmManagerApp extends StatelessWidget {
  const FarmManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'پاک فارم مینیجر',
      theme: ThemeData(
        // ایپ کا بنیادی رنگ سبز رکھا ہے
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'UrduFont', // اردو فونٹ کا استعمال
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ہوم اسکرین جس میں نیویگیشن بار ہوگا
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // یہ بتاتا ہے کہ کون سا ٹیب منتخب ہے

  // مختلف اسکرینوں کی لسٹ
  static const List<Widget> _screens = <Widget>[
    DashboardTab(), // مرکزی ڈیش بورڈ
    CropsTab(),     // فصلوں کا ریکارڈ
    LivestockTab(), // مویشیوں کا ریکارڈ
    FinanceTab(),   // مالیات اور حساب کتاب
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('پاک فارم مینیجر', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.green[700],
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      // نیچے والا نیویگیشن بار
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'ڈیش بورڈ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture_outlined),
            activeIcon: Icon(Icons.agriculture),
            label: 'فصلیں',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets_outlined),
            activeIcon: Icon(Icons.pets),
            label: 'لائیو اسٹاک',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            activeIcon: Icon(Icons.monetization_on),
            label: 'مالیات',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}

// --- یہاں سے آگے ہر ٹیب کی عارضی اسکرینیں ہیں ---

// 1. ڈیش بورڈ ٹیب (جیسا تصویر میں ہے)
class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('ڈیش بورڈ کا ڈیزائن یہاں آئے گا', style: TextStyle(fontSize: 24)));
  }
}

// 2. فصلوں کا ٹیب
class CropsTab extends StatelessWidget {
  const CropsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('فصلوں کا ریکارڈ یہاں ہوگا', style: TextStyle(fontSize: 24)));
  }
}

// 3. لائیو اسٹاک ٹیب
class LivestockTab extends StatelessWidget {
  const LivestockTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('جانوروں کا ریکارڈ یہاں ہوگا', style: TextStyle(fontSize: 24)));
  }
}

// 4. مالیات ٹیب
class FinanceTab extends StatelessWidget {
  const FinanceTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('حساب کتاب یہاں ہوگا', style: TextStyle(fontSize: 24)));
  }
}
