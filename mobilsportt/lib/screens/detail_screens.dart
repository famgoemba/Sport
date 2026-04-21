import 'package:flutter/material.dart';
import '../models/car_model.dart';

class DetailScreen extends StatelessWidget {
  final Car car;
  const DetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header dengan Gambar yang bisa di-scroll
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(car.imageUrl, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(car.name, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Text(car.price, style: const TextStyle(fontSize: 20, color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  const Text("SPECIFICATIONS", style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold, color: Colors.white60)),
                  const SizedBox(height: 20),
                  
                  // Baris Spesifikasi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSpecItem(Icons.speed, "Top Speed", car.topSpeed),
                      _buildSpecItem(Icons.bolt, "Power", car.power),
                      _buildSpecItem(Icons.settings, "Engine", car.engine),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "This masterpiece of engineering combines raw power with elegant design, providing an unparalleled driving experience for those who demand only the best.",
                    style: TextStyle(color: Colors.white70, height: 1.6),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSpecItem(IconData icon, String title, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.blueAccent, size: 30),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(color: Colors.white38, fontSize: 12)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}