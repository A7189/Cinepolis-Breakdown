import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Variabel untuk menyimpan status checkbox
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar di bagian atas
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                'Assets/login3.jpeg', // Pastikan path gambar benar
                fit: BoxFit.fitWidth, // Sesuaikan agar gambar terlihat rapi
              ),
            ),
            const SizedBox(height: 20),
            // Judul dan deskripsi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hai Moviegoers!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Sudah siap merasakan pengalaman menonton yang tidak terlupakan?",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            // Input Email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email or WhatsApp Number",
                  floatingLabelBehavior: FloatingLabelBehavior
                      .always, // Selalu tampilkan label di atas
                  contentPadding: const EdgeInsets.only(
                      top: 24, left: 12, right: 12), // Tambahkan jarak atas
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
// Input Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  floatingLabelBehavior: FloatingLabelBehavior
                      .always, // Selalu tampilkan label di atas
                  contentPadding: const EdgeInsets.only(
                      top: 24, left: 12, right: 12), // Tambahkan jarak atas
                  suffixIcon: const Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),
            //   dan teks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value ?? false; // Toggle status checkbox
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      "Ya, saya menerima syarat dan ketentuan yang berlaku.",
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Tombol Login
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: _isChecked
                    ? () {
                        // Navigasi ke halaman '/dashboard'
                        Navigator.pushNamed(context, '/Home');
                      }
                    : null, // Tombol disable jika checkbox tidak dicentang
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], // Warna biru untuk tombol
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Teks tambahan di bawah
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum punya akun?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman pendaftaran
                    },
                    child: Text(
                      "Daftar di sini",
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}