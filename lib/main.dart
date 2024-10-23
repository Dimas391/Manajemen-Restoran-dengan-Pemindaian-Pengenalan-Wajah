import 'package:flutter/material.dart';
import 'face.dart'; // Import Halaman SignUp
import 'SignUpPage.dart';
//import 'face_scan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false; // Status untuk menampilkan password
  String _selectedAuthMethod = 'Email'; // Metode autentikasi yang dipilih
  final List<String> _authMethods = ['Email', 'Phone', 'Social Media']; // Daftar metode autentikasi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradien Latar Belakang
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1F1530), Color(0xFF2E0E5C)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo di atas
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        'image/logo.png', // Ganti dengan jalur logo Anda
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Jarak antara logo dan gambar

                // Gambar burger di atas
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: Image.asset(
                    'image/burger.png', // Ganti dengan jalur gambar burger Anda
                    height: 300, // Tinggi gambar
                    width: 300, // Lebar gambar
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 20),

                // Bagian Selamat Datang Kembali dengan Transparansi dan Lebar Penuh
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50), // Sudut membulat di atas
                    topRight: Radius.circular(50),
                  ),
                  child: Container(
                    width: double.infinity, // Pastikan kontainer mengambil lebar penuh
                    color: Colors.white.withOpacity(0.1), // Latar belakang semi-transparan
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),

                        // TextField Alamat Email
                        TextField(
                          style: TextStyle(color: Colors.white), // Mengubah warna teks input menjadi putih
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.email, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2), // Transparan dari hitam
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white), // Garis tepi putih
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Menambahkan padding
                          ),
                        ),
                        SizedBox(height: 20),

                        // Dropdown Autentikasi
                        // TextField(
                        //   style: TextStyle(color: Colors.white), // Mengubah warna teks input menjadi putih
                        //   decoration: InputDecoration(
                        //     labelText: "Autentikasi",
                        //     labelStyle: TextStyle(color: Colors.white),
                        //     prefixIcon: Icon(Icons.person, color: Colors.white),
                        //     filled: true,
                        //     fillColor: Colors.white.withOpacity(0.2), // Transparan dari hitam
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //       borderSide: BorderSide(color: Colors.white), // Garis tepi putih
                        //     ),
                        //     contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Menambahkan padding
                        //   ),
                        // ),
                        //SizedBox(height: 20),

                        // TextField Username
                        TextField(
                          style: TextStyle(color: Colors.white), // Mengubah warna teks input menjadi putih
                          decoration: InputDecoration(
                            labelText: "Username",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2), // Transparan dari hitam
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white), // Garis tepi putih
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Menambahkan padding
                          ),
                        ),
                        SizedBox(height: 20),

                        // TextField Password
                        TextField(
                          obscureText: !_isPasswordVisible, // Tampilkan atau sembunyikan password
                          style: TextStyle(color: Colors.white), // Mengubah warna teks input menjadi putih
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.lock, color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible 
                                  ? Icons.visibility 
                                  : Icons.visibility_off,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible; // Toggle password visibility
                                });
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2), // Transparan dari hitam
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white), // Garis tepi putih
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Menambahkan padding
                          ),
                        ),
                        SizedBox(height: 10),

                        // Lupa Password
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an Account?',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                               Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUpPage()),
                              );
                              // Navigasi ke halaman login, Anda dapat menyesuaikan ini
                            },
                            child: Text('Login'),
                          ),
                        ],
                      ),

                        // Tombol Sign In dengan Gradien
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFC466B), // Grad
                                Color(0xFFFC466B), // Gradien merah muda
                                Color(0xFF3F5EFB), // Gradien ungu
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigasi ke Halaman Sign Up
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FaceRecognitionScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white, // Warna teks menjadi putih
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Atau lanjutkan dengan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.white54),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Tombol Media Sosial
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildGoogleButton(), // Google
                            _buildSocialButton(Icons.apple, Colors.white), // Apple
                            _buildSocialButton(Icons.facebook, Colors.blue), // Facebook
                          ],
                        ),
                        SizedBox(height: 30),

                        // Sign Up
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an Account?",
                              style: TextStyle(color: Colors.white54),
                            ),
                            // TextButton(
                            //   onPressed: () {
                            //     // Navigasi ke halaman Sign Up jika tombol ini ditekan
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(builder: (context) => SignUpPage()),
                            //     );
                            //   },
                            //   child: Text('Create Account'),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Metode untuk membangun tombol Google dengan logo Google
  Widget _buildGoogleButton() {
    return CircleAvatar(
      backgroundColor: Colors.white12,
      child: Image.asset(
        'image/Buttons.png', // Ganti dengan jalur gambar logo Google Anda
        height: 100,
        width: 100,
      ),
    );
  }

  // Metode untuk tombol media sosial lainnya
  Widget _buildSocialButton(IconData icon, Color color) {
    return CircleAvatar(
      backgroundColor: Colors.white12,
      child: Icon(
        icon,
        color: color, // Gunakan warna media sosial yang sesuai
        size: 24,
      ),
    );
  }
}
