import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ukl/widgets/bottom_nav.dart';
import 'package:ukl/widgets/carousel.dart';
import 'my_booking.dart';
import 'cinema.dart';
import 'movie.dart';

class HomePage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<HomePage> {
  final List<String> bannerImages = [
    'assets/GUNA-GUNA.jpeg',
    'assets/NEGERI.jpeg',
    'assets/MOANA2.jpeg',
  ];

  final List<String> NowShowing= [
    'assets/ENDGAME.jpeg',
    'assets/MOANA2.jpeg',
    'assets/MENCURI-RADEN.jpeg',
    'assets/UPIN-IPIN.jpeg',
    'assets/MINECRAFT.jpeg',
  ];

  final List<String> upcomingImages = [
    'assets/SIJUKI.jpg',
    'assets/KRAVEN.jpeg',
    'assets/FFX.jpg',
    'assets/DOOMSDAY.jpeg',
    'assets/BOLA.jpeg',
  ];

  final List<String> promotionImages = [
    'assets/PROMO3.jpeg',
    'assets/PROMO2.jpeg',
    'assets/PROMO1.jpeg',
  ];

  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String selectedCity = 'Malang';
    return Scaffold(
     appBar: AppBar(
  backgroundColor: Color.fromARGB(255, 255, 255, 255),
  elevation: 0,
  title: Row(
    children: [
      Icon(Icons.location_on, color: Color.fromRGBO(24, 30, 115,1.0),),
      SizedBox(width: 5),
      DropdownButton<String>(
              value: selectedCity,
              items: const [
                DropdownMenuItem(
                  value: 'Malang',
                  child: Text('Malang'),
                ),
                DropdownMenuItem(
                  value: 'Surabaya',
                  child: Text('Surabaya'),
                ),
                DropdownMenuItem(
                  value: 'Jakarta',
                  child: Text('Jakarta'),
                ),
              ],
              onChanged: (value) {
                // Logika untuk mengubah kota dapat ditambahkan di sini
              },
              underline: Container(),
            ),
    ],
  ),
  actions: [
    IconButton(
      onPressed: () {
        // Add favorite action here
      },
      icon: Icon(
        CupertinoIcons.heart,
        color: Color.fromRGBO(24, 30, 115, 1.0),
      ),
    ),
    IconButton(
      onPressed: () {
        // Add notification action here
      },
      icon: Icon(
        CupertinoIcons.bell,
        color: Color.fromRGBO(24, 30, 115, 1.0),
      ),
    ),
    IconButton(
      onPressed: () {
        // Add profile action here
      },
      icon: Icon(
        CupertinoIcons.person_circle_fill,
        color: Color.fromRGBO(24, 30, 115, 1.0),
      ),
    ),
  ],
),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                  Text(
                    'Hello,',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   Text(
                    ' Guest',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  ],),
                  Text(
                    'Mau nonton apa hari ini?',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            SizedBox(
              height: 250,
              child: PageView.builder(
                controller: _pageController,
                itemCount: bannerImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        bannerImages[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Now Showing Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Now Showing",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 27, 28, 115)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 27, 28, 115)),
                    ),
                  )
                ],
              ),
            ),
            // Carousel Poster Section
            CarouselDemo(imageList: NowShowing),
            // Upcoming Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 0, 122),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   Text(
                    'See All',
                    style: TextStyle(
                      color: Color.fromARGB(255, 106, 103, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcomingImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        upcomingImages[index],
                        width: 216,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Promotion Section
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                'Promotion',
                style: TextStyle(
                  color: Color.fromARGB(255, 2, 0, 122),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
               Text(
                    'See All',
                    style: TextStyle(
                      color: Color.fromARGB(255, 106, 103, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
              ]
            ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: promotionImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        promotionImages[index],
                        width: 450,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(0),
    );
  }
}