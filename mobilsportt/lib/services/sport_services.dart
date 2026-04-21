class SportService {
  final List<Map<String, String>> _carList = [
    {'name': 'Lamborghini Revuelto', 'image': 'https://boulevard.co/wp-content/uploads/2024/08/lamborghini-revuelto-1.png'},
    {'name': 'Porsche 911 GT3 RS', 'image': 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=1000&auto=format&fit=crop'},
    {'name': 'Ferrari SF90 Stradale', 'image': 'https://images.unsplash.com/photo-1592198084033-aade902d1aae?q=80&w=1000&auto=format&fit=crop'},
  ];

  List<Map<String, String>> getCars() => _carList;

  void addCar(String name, String imageUrl) {
    _carList.add({'name': name, 'image': imageUrl});
  }
}