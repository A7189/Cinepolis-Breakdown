import 'package:flutter/material.dart';
import 'package:ukl/widgets/bottom_nav.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});
   @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bookings = [
      {
        'image': 'Assets/FFX.jpg',
        'title': 'FAST AND FURIOUS X',
        'genre': 'Action, Adventure',
        'rating': 10,
        'age' : '18+',
      },
      {
        'image': 'Assets/SIJUKI.jpg',
        'title': 'SIJUKI PANITIA HARI AKHIR',
        'genre': 'Comedy,Adventure',
        'rating': 9.3,
        'age' : '10+',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Booking',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: () {
              // Logika refresh
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "There's no active booking!",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            booking['image'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                booking['title'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 4),
                              decoration:
                                  BoxDecoration(color:index == 0 ? Colors.red.shade50 :index == 1 ? Colors.grey.shade100 : Colors.green.shade50),
                              child: Text(booking['age'].toString(),style: TextStyle(color: index == 0 ? Colors.red : index == 1 ? Colors.black : Colors.green),),
                                  ),
                                   SizedBox(
                              width: 10,
                            ),
                            Text(booking['genre'].toString(),style: TextStyle(color: Colors.grey),)
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    booking['rating'].toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }
}