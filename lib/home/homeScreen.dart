import 'package:flutter/material.dart';
import 'package:movies_app/home/Search/Search_screen.dart';
import 'package:movies_app/home/browse/Browse_screen.dart';
import 'package:movies_app/home/main_screen/mainScreen.dart';
import 'package:movies_app/home/watch_list/watchList_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFFFBB3B),
        unselectedItemColor: Color(0xFFC6C6C6),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: (index){

          setState((){
            selectedIndex=index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Color(0xFF1A1A1A),
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Color(0xFF1A1A1A),
              icon: Icon(Icons.search),
              label: 'Search'),
          BottomNavigationBarItem(
              backgroundColor: Color(0xFF1A1A1A),
              icon: Icon(Icons.movie),
              label: 'Browse'),
          BottomNavigationBarItem(
              backgroundColor: Color(0xFF1A1A1A),
              icon: ImageIcon(AssetImage('assets/images/watchList_ic.png')),
              label: 'WatchList')
        ],
      ),
    );
  }

  List<Widget>tabs=[MainScreen(),SearchScreen(),BrowseScreen(),WatchListScreen()];
}
