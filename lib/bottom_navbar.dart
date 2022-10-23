import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(bottomNavbar());
}

class bottomNavbar extends StatefulWidget {
  const bottomNavbar({super.key});

  @override
  State<bottomNavbar> createState() => _bottomNavbarState();
}

class _bottomNavbarState extends State<bottomNavbar> {
  int _bottomNavIndex = 1;
  var pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Search Page')),
    Center(child: Text('Profile Page')),
  ];
  final iconList = <IconData>[
    Icons.favorite,
    Icons.person,
  ];

  final txtList = ['Favourite', 'Profile'];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: pages[_bottomNavIndex], //destination screen
      floatingActionButton: SizedBox(
        height: 80,
        child: FloatingActionButton(
            backgroundColor: _bottomNavIndex == 2 ? Colors.orange : Colors.grey,
            child: Icon(
              Icons.search,
              // size: 100,
            ),
            onPressed: () {
              setState(() {
                _bottomNavIndex = 2;
              });
            }
            //params
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.orange : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconList[index], size: 24, color: color),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  txtList[index],
                  maxLines: 1,
                  style: TextStyle(color: color),
                ),
              )
            ],
          );
        },
        height: 60,

        backgroundColor: Colors.white,
        elevation: 30,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        activeIndex: _bottomNavIndex,
        itemCount: iconList.length,
        onTap: (index) => setState(() => _bottomNavIndex = index),

        //other params
      ),
    ));
  }
}
