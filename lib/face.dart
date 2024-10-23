import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:camera/camera.dart'; // Import camera package

class FaceRecognitionScreen extends StatefulWidget {
  @override
  _FaceRecognitionScreenState createState() => _FaceRecognitionScreenState();
}

class _FaceRecognitionScreenState extends State<FaceRecognitionScreen> {
  CameraController? _cameraController; // Menggunakan CameraController? untuk null safety
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      // Mendapatkan daftar kamera yang tersedia
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _cameraController = CameraController(
          cameras[0], // Menggunakan kamera pertama yang tersedia
          ResolutionPreset.high,
        );

        // Inisialisasi kontroler
        _initializeControllerFuture = _cameraController!.initialize();
        setState(() {});
      } else {
        print("No cameras available");
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose(); // Memastikan dispose hanya jika controller tidak null
    super.dispose();
  }

  Future<void> _scanFace() async {
    const url = 'http://192.168.225.78:5000/video_feed'; // Ganti dengan alamat IP server Anda
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && _cameraController != null) {
            // Jika kamera telah diinisialisasi, tampilkan preview kamera
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Menampilkan preview kamera
                Expanded(
                  child: CameraPreview(_cameraController!), // Menggunakan cameraController yang telah diinisialisasi
                ),
                SizedBox(height: 20),

                // Button Face Scan
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    await _scanFace();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.camera_alt, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Face Scan',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            // Menangani error saat inisialisasi kamera
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Menampilkan indikator loading saat kamera belum siap
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  }
