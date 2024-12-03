import 'package:flutter/material.dart';
import 'package:ukl/widgets/bottom_nav.dart';
import 'movie.dart';
import 'widgets/bottom_nav.dart';

class CinemaPage extends StatelessWidget {
  const CinemaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data bioskop
    final List<Map<String, String>> cinemas = [
      {
        'name': 'Malang Town Square',
        'distance': '9.0 km away',
        'type': 'REGULAR • LUXE',
      },
      {
        'name': 'Lippo Plaza Batu',
        'distance': '11.23 km away',
        'type': 'REGULAR',
      },
    ];

    String selectedCity = 'Malang';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DropdownButton di kiri atas
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
            const SizedBox(height: 10),
            // Kotak pencarian
            TextField(
              decoration: InputDecoration(
                hintText: 'Cinema / Movie',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            // Navigasi antar tab
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigasi ke MoviePage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MoviePage()),
                          );
                        },
                        child: const Text(
                          'Movie',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey, // Teks abu-abu saat tidak aktif
                          ),
                        ),
                      ),
                      Container(
                        height: 2, // Ketebalan garis
                        width: double.infinity, // Panjang garis penuh kolom
                        color: Colors.blue, // Warna garis biru
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  width: 20,
                  thickness: 1,
                  color: Colors.grey, // Warna garis vertikal
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Tetap di halaman Cinema
                        },
                        child: const Text(
                          'Cinema',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue, // Warna teks biru saat aktif
                          ),
                        ),
                      ),
                      Container(
                        height: 2, // Ketebalan garis
                        width: double.infinity, // Panjang garis penuh kolom
                        color: Colors.blue, // Warna garis biru
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // List bioskop
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: cinemas.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color.fromARGB(255, 27, 28, 115),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  cinemas[index]['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(
                                Icons.directions_walk,
                                size: 18,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                cinemas[index]['distance']!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.movie_filter,
                                size: 18,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                cinemas[index]['type']!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(3),
    );
  }
}