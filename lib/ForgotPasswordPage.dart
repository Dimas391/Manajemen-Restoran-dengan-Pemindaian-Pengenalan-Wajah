import 'package:flutter/material.dart';
import 'CreatePassword.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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

                // Gambar di atas
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: Image.asset(
                    'image/burger.png', // Ganti dengan jalur gambar Anda
                    height: 300, // Tinggi gambar
                    width: 300, // Lebar gambar
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 20),

                // Forgot Password Section with Transparency and Full Width
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
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Autentikasi 2 Langkah',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),

                        // Email Address TextField
                        TextField(
                          style: TextStyle(color: Colors.white), // Mengubah warna teks input menjadi putih
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.email, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Menambahkan padding
                          ),
                        ),
                        SizedBox(height: 20),

                        // Authentication Code TextField
                        TextField(
                          style: TextStyle(color: Colors.white), // Mengubah warna teks input menjadi putih
                          decoration: InputDecoration(
                            labelText: "Autentikasi",
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

                        // New Password TextField
                        TextField(
                          obscureText: !_isPasswordVisible, // Tampilkan atau sembunyikan password
                          style: TextStyle(color: Colors.white), // Mengubah warna teks input menjadi putih
                          decoration: InputDecoration(
                            labelText: "New Password",
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
                        SizedBox(height: 20),

                        // Reset Password Button
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CreatePasswordPage()),
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

                        // Or continue with
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Or sign up with',
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
                        SizedBox(height: 20),

                        // Back to Sign In
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Remember your password? ',
                              style: TextStyle(color: Colors.white54),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Kembali ke halaman sebelumnya
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
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
        height: 100,
        width: 100,
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
