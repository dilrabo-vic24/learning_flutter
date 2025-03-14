import 'package:agranom_ai/data/services/data.dart';
import 'package:agranom_ai/presentation/screens/home/history_screen.dart';
import 'package:agranom_ai/presentation/widgets/custom_appbar.dart';
import 'package:agranom_ai/presentation/widgets/landing_widget.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const LandingWidget(),
    // const CameraScreen(),
    HistoryWidget(history: history),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5EDE7),
      appBar: _currentIndex == 1 ? HistoryAppBar() : const CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xffF5EDE7),
              Colors.green.withOpacity(0.1),
            ],
          ),
        ),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xff81C784),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: _buildNavItem(
                  0,
                  Icons.home_outlined,
                  '',
                ),
              ),
              const SizedBox(width: 80),
              Expanded(
                child: _buildNavItem(
                  1,
                  Icons.history,
                  'History',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.green, Color(0xff81C784)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(32.5),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: const Color.fromARGB(0, 240, 240, 240),
            onPressed: () => Navigator.pushNamed(context, "/camera"),
            child: const Icon(
              Icons.add_a_photo,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() => _currentIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.green.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.grey,
                  size: 32,
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
