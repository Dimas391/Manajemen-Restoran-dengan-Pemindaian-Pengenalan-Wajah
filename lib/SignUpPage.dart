import 'package:flutter/material.dart';
import 'ForgotPasswordPage.dart';
import 'home.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false; // Status untuk menampilkan password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
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
                // Logo at the top
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        'image/logo.png', // Ganti dengan jalur logo Anda
                        height: 50,
                      ),
                      SizedBox(width: 10),
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

                // Sign Up Section with Transparency and Full Width
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50), // Rounded corners on top
                    topRight: Radius.circular(50),
                  ),
                  child: Container(
                    width: double.infinity, // Ensure the container takes full width
                    color: Colors.white.withOpacity(0.1), // Semi-transparent background
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Welcome Back we missed you',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),

                        // Username TextField
                        TextField(
                          style: TextStyle(color: Colors.white), // Mengubah warna teks input menjadi putih
                          decoration: InputDecoration(
                            labelText: "Username",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Menambahkan padding
                          ),
                        ),
                        SizedBox(height: 20),

                        // Email Address TextField
                        // TextField(
                        //   style: TextStyle(color: Colors.white), // Mengubah warna teks input menjadi putih
                        //   decoration: InputDecoration(
                        //     labelText: "Email Address",
                        //     labelStyle: TextStyle(color: Colors.white),
                        //     prefixIcon: Icon(Icons.email, color: Colors.white),
                        //     filled: true,
                        //     fillColor: Colors.white.withOpacity(0.2),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Menambahkan padding
                        //   ),
                        // ),
                        // SizedBox(height: 20),

                        // Password TextField
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
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Menambahkan padding
                          ),
                        ),
                        SizedBox(height: 10),

                        Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Navigasi ke halaman Forgot Password
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white54, // Warna teks
                            ),
                          ),
                        ),
                      ),


                         Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? Create Account",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigasi ke halaman login, Anda dapat menyesuaikan ini
                            },
                            child: Text('Login'),
                          ),
                        ],
                      ),

                        // Sign Up Button
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFC466B), // Pink gradient start
                                Color(0xFF3F5EFB), // Purple gradient end
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Home()), // Ganti dengan halaman Home Anda
                            );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white, // Warna teks menjadi putih
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Or continue with
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

                        // Social Media Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildGoogleButton(), // Google
                            _buildSocialButton(Icons.apple, Colors.white), // Apple
                            _buildSocialButton(Icons.facebook, Colors.blue), // Facebook
                          ],
                        ),
                        SizedBox(height: 30),

                        // Kembali ke halaman login
                       
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

  // Method to build the Google button with the Google logo
  Widget _buildGoogleButton() {
    return CircleAvatar(
      backgroundColor: Colors.white12,
      child: Image.asset(
        'image/Buttons.png', // Ganti dengan jalur logo Google Anda
        height: 74,
        width: 74,
      ),
    );
  }

  // Method for other social media buttons
  Widget _buildSocialButton(IconData icon, Color color) {
    return CircleAvatar(
      backgroundColor: Colors.white12,
      child: Icon(
        icon,
        color: color, // Gunakan warna sesuai dengan media sosial
        size: 24,
      ),
    );
  }
}