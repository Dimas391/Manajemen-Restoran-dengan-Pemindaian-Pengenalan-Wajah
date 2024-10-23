import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import untuk Google Maps
import 'profile.dart';
import 'pemesanan.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final LatLng _initialPosition = LatLng(-4.2417, 97.1448); // Lokasi awal di Politeknik Negeri Lhokseumawe
  final double _zoomLevel = 12.0;
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      onMapCreated: (controller) {
        _controller = controller;
        _setMapStyle();
      },
    );
  }

  // Fungsi untuk menerapkan gaya peta dengan warna putih
  void _setMapStyle() async {
    String style = '''
    [
      {
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#ffffff"
          }
        ]
      },
      {
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#ffffff"
          }
        ]
      },
      {
        "elementType": "labels.text.stroke",
        "stylers": [
          {
            "color": "#ffffff"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#ffffff"
          }
        ]
      },
      {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#ffffff"
          }
        ]
      },
      {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#ffffff"
          }
        ]
      }
    ]
    ''';
    _controller?.setMapStyle(style);
  }
}

class HomeScreen extends StatelessWidget {
  final LatLng _initialPosition = LatLng(5.120625, 97.1557914); // Lokasi awal di Politeknik Negeri Lhokseumawe
  final double _zoomLevel = 12.0;
  final Function(GoogleMapController) onMapCreated;

  HomeScreen({required this.onMapCreated});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'image/logo.png',
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      ElevatedButton(
                        onPressed: () {
                           Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => ProfilePage()), // Ganti dengan halaman Home Anda
                            );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 53,
                        child: ElevatedButton(
                          onPressed: () {
                           
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                          ),
                          child: Text(
                            'Search',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Enjoy Our delicious food',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.red],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextButton(
                                onPressed: () {
                                   Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  PemesananPage ()), // Ganti dengan halaman Home Anda
                            );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40.0, vertical: 15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  'Pesan',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'image/makanan.png',
                                height: 220,
                                width: 220,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'WHAT WE SERVE',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 213, 78, 236),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Your Favourite Food',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'image/iklan.png',
                              width: 380,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Mudah di gunakan',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Anda hanya perlu menyelesaikan beberapa langkah untuk melakukan pemesanan',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'image/iklan2.png',
                              width: 380,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Qualitas Terbaik',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Tidak hanya cepat bagi kami kualitas',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Google Maps di bagian bawah
            Container(
              height: 400, // Mengatur tinggi Google Maps
              width: double.infinity, // Memenuhi lebar layar
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialPosition, // Lokasi awal peta
                  zoom: _zoomLevel,
                ),
                onMapCreated: onMapCreated,
                mapType: MapType.normal,
                markers: {
                  Marker(
                    markerId: MarkerId('lokasi_kafe'),
                    position: _initialPosition, // Lokasi marker
                    infoWindow: InfoWindow(title: 'Kafe Kami'),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
