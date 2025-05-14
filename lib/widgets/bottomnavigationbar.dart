import 'package:flutter/material.dart';
import 'package:managment/Screens/add.dart';
import 'package:managment/Screens/home.dart';
import 'package:managment/Screens/statistics.dart';
import 'package:managment/theme/theme.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> with TickerProviderStateMixin {
  int currentIndex = 0;
  late final PageController _pageController;

  final List<Widget> screens = [Home(), Statistics()];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        children: screens,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Add_Screen()));
        },
        backgroundColor: AppColors.header,
        foregroundColor: AppColors.secondaryText,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: AppColors.card,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildTabItem(icon: Icons.home, index: 0, label: 'Home'),
            const SizedBox(width: 48), // Space for FAB
            _buildTabItem(icon: Icons.bar_chart, index: 1, label: 'Stats'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required IconData icon,
    required int index,
    required String label,
  }) {
    final bool isSelected = currentIndex == index;
    return InkWell(
      onTap: () => onTabTapped(index),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🛠️ Prevents overflow
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? AppColors.accent : AppColors.secondaryText,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors.accent : AppColors.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
