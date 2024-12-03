import 'package:ukl/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'cinema.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar film dengan gambar lokal dan judul
    final List<Map<String, String>> movies = [
      {
        'title': 'FAST AND FURIOUS X',
        'image': 'Assets/FFX.jpg',
      },
      {
        'title': 'SIJUKI PANITIA HARI AKHIR',
        'image': 'Assets/SIJUKI.jpg',
      },
      {
        'title': 'GODZILLA KING OF THE MONSTER',
        'image': 'Assets/GODZILLA.png',
      },
      {
        'title': 'PLANES',
        'image': 'Assets/PLANE2.jpg',
      },
    ];

    String selectedLocation = 'Malang';

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dropdown di kiri atas
              Row(
                children: [
                  DropdownButton<String>(
                    value: selectedLocation,
                    items: const [
                      DropdownMenuItem(value: 'Malang', child: Text('Malang')),
                      DropdownMenuItem(value: 'Surabaya', child: Text('Surabaya')),
                      DropdownMenuItem(value: 'Jakarta', child: Text('Jakarta')),
                    ],
                    onChanged: (value) {
                      // Anda bisa tambahkan logika di sini
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Kotak pencarian
              TextField(
                decoration: InputDecoration(
                  hintText: 'Movie / Cinema',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              // Tetap di halaman Movie
            },
            child: Text(
              'Movie',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Warna teks biru
              ),
            ),
          ),
          Container(
            height: 2, // Ketebalan garis
            width: double.infinity, // Garis sepanjang kolom
            color: Colors.blue, // Warna garis biru
            margin: const EdgeInsets.symmetric(horizontal: 20), // Margin dari sisi kiri/kanan
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
              // Navigasi ke halaman CinemaPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CinemaPage()),
              );
            },
            child: Text(
              'Cinema',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey, // Warna teks abu-abu
              ),
            ),
          ),
          Container(
            height: 2, // Ketebalan garis
            width: double.infinity, // Garis sepanjang kolom
            color: Colors.blue, // Warna garis biru
            margin: const EdgeInsets.symmetric(horizontal: 20), // Margin dari sisi kiri/kanan
          ),
        ],
      ),
    ),
  ],
),
              const SizedBox(height: 20),
              // GridView daftar film
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 500, // Tinggi setiap item grid
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.asset(
                              movies[index]['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movies[index]['title']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(24, 30, 115,1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size.fromHeight(40),
                            ),
                            child: const Text(
                              'Book Now',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(2),
    );
  }
}