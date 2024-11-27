import 'package:flutter/material.dart';
import 'package:pannel_clone/presentation/pages/accounts_page.dart';
import 'package:pannel_clone/presentation/pages/explore_page.dart';
import 'package:pannel_clone/presentation/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [const HomePage(), const ExplorePage(), const AccountsPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        iconSize: 32,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
        BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard), label: "Explore"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined), label: "Account"),
      ]),
    );
  }
}
