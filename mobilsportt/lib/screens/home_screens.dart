import 'package:flutter/material.dart';
import '../services/sport_services.dart';
import '../models/car_model.dart';
import 'detail_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SportService _sportServices = SportService();
  late List<Car> _cars;

  @override
  void initState() {
    super.initState();
    _cars = _sportServices.getCars().cast<Car>(); // Ambil data mobil saat inisialisasi
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D), // Hitam pekat mewah
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "LUXURY DRIVES",
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.blueAccent),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Header Sapaan
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello, Speed Hunter", style: TextStyle(color: Colors.white54)),
                Text("Find Your Beast", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
          ),

          // Horizontal Categories (Hanya Visual)
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              children: [
                _buildCategoryItem("All Cars", true),
                _buildCategoryItem("Hypercars", false),
                _buildCategoryItem("Supercars", false),
                _buildCategoryItem("Classic", false),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Main List Mobil
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _cars.length,
              itemBuilder: (context, index) {
                final car = _cars[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailScreen(car: car)),
                    );
                  },
                  child: _buildCarCard(car),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () async {
          await Navigator.pushNamed(context, '/tambah');
          setState(() {
            _cars = _sportServices.getCars().cast<Car>(); // Refresh data
          });
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Widget untuk Kartu Mobil di Home
  Widget _buildCarCard(Car car) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Stack(
        children: [
          // Gambar Background
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              car.imageUrl,
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey),
            ),
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
              ),
            ),
          ),
          // Info Teks
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(car.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.bolt, color: Colors.blueAccent, size: 16),
                        const SizedBox(width: 5),
                        Text(car.power, style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.arrow_forward_ios, size: 15, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Helper untuk Kategori
  Widget _buildCategoryItem(String title, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isActive ? Colors.blueAccent : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white38,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}