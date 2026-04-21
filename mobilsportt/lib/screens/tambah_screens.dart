import 'package:flutter/material.dart';
import '../services/sport_services.dart';

class TambahScreen extends StatefulWidget {
  const TambahScreen({super.key});

  @override
  State<TambahScreen> createState() => _TambahScreenState();
}

class _TambahScreenState extends State<TambahScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final SportService _sportService = SportService();
  
  // Variabel untuk menyimpan URL yang akan ditampilkan di preview
  String _previewImageUrl = "";

  void _handleSave() {
    if (_nameController.text.isNotEmpty && _imageController.text.isNotEmpty) {
      _sportService.addCar(_nameController.text, _imageController.text);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Harap isi semua kolom!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ADD NEW BEAST")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // --- BAGIAN PREVIEW GAMBAR ---
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: _previewImageUrl.isEmpty
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo_outlined, size: 50, color: Colors.blueAccent),
                          Text("Input URL below to preview", style: TextStyle(color: Colors.white38)),
                        ],
                      )
                    : Image.network(
                        _previewImageUrl,
                        fit: BoxFit.cover,
                        // Menangani jika URL salah atau error saat loading
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Text("Invalid Image URL", style: TextStyle(color: Colors.redAccent)));
                        },
                      ),
              ),
            ),
            const SizedBox(height: 30),
            
            _buildInputLabel("Car Name"),
            _buildCustomField(_nameController, "e.g. Bugatti Chiron", null),
            
            const SizedBox(height: 20),
            
            _buildInputLabel("Image URL"),
            // Tambahkan fungsi onChanged agar preview update otomatis
            _buildCustomField(_imageController, "Paste image link here...", (val) {
              setState(() {
                _previewImageUrl = val;
              });
            }),

            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: _handleSave,
              child: const Text("CONFIRM & SAVE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper dengan tambahan fungsi onChanged
  Widget _buildCustomField(TextEditingController controller, String hint, Function(String)? onChanged) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 5),
        child: Text(label, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
      ),
    );
  }
}