import 'package:flutter/material.dart';
import 'package:lassod_interview_task/screens/homepage.dart';
import 'package:lassod_interview_task/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List bottomNavBarTitle = ["Home", "Moments", "Chat", "Profile"];
  final List<Widget> pages = [
    const Homepage(),
    Container(),
    Container(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> navBarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/home.png",
            color: currentIndex == 0 ? darkGrey : lightGrey,
          ),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/home.png",
            color: currentIndex == 1 ? darkGrey : lightGrey,
          ),
          label: "Moments"),
      BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/send.png",
            color: currentIndex == 2 ? darkGrey : lightGrey,
          ),
          label: "Chat"),
      BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/username.png",
            color: currentIndex == 3 ? darkGrey : lightGrey,
          ),
          label: "Profile")
    ];
    return Scaffold(
      body: WillPopScope(
          onWillPop: () {
            throw "";
          },
          child: pages[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: navBarItem,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: darkGrey,
        unselectedItemColor: lightGrey,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}
