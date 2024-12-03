import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  BottomNav(this.page);
  int page;
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  getPage(index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/Home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/Booking');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/Movie');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/Cinema');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      currentIndex: widget.page,
      onTap: getPage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_online),
          label: "My Booking",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: "Movie",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.theaters),
          label: "Cinema",
        ),
      ],
    );
  }
}