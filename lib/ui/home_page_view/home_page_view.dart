import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:second_opinion_app/ui/home/home.dart';

import '../more/more.dart';
import '../reports/report.dart';
import '../second_opinion/doctors.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _buildBottomNavBar(),
      body: _buildCurrentIndexWidget(),
    );
  }

  Widget _buildCurrentIndexWidget() {
    return <Widget>[
      HomeScreen(),
      ReportsScreen(
        onBackPressed: () {
          setState(() {
            currentPageIndex = 0;
          });
        },
      ),
      DoctorsScreen(),
      MoreScreen(
        onBackPressed: () {
          setState(() {
            currentPageIndex = 0;
          });
        },
      )
    ][currentPageIndex];
  }

  List<BottomNavigationBarItem> _buildDestinationList() {
    return [
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Selected_home.svg',
            color: currentPageIndex == 0 ? Theme.of(context).primaryColor : Colors.white,
          ),
          label: 'Home'),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/icons/unselected_report.svg',
          color: currentPageIndex == 1 ? Color(0xFF1ce0a3) : Colors.white,
        ),
        label: 'Report',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/icons/unselected_opinion.svg', color: currentPageIndex == 2 ? Color(0xFFec652a) : Colors.white),
        label: 'Second Opinion',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/icons/More_unselected.svg',
          color: currentPageIndex == 3 ? Theme.of(context).primaryColor : Colors.white,
        ),
        label: 'More',
      ),
    ];
  }

  Widget _buildBottomNavBar() {
    Color selectedItemColor = Theme.of(context).primaryColor;
    switch (currentPageIndex) {
      case 1:
        selectedItemColor = Color(0xFF1ce0a3);
        break;
      case 2:
        selectedItemColor = Color(0xFFec652a);
        break;
      default:
        selectedItemColor = Theme.of(context).primaryColor;
    }

    return BottomNavigationBar(
      backgroundColor: Color(0xFF202a2b),
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(overflow: TextOverflow.visible),
      type: BottomNavigationBarType.fixed,
      elevation: 5,
      selectedLabelStyle: TextStyle(overflow: TextOverflow.visible),
      onTap: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      currentIndex: currentPageIndex,
      selectedItemColor: selectedItemColor,
      items: _buildDestinationList(),
    );
  }
}
