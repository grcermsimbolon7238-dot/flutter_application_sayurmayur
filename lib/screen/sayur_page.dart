import 'package:flutter/material.dart';
import 'package:flutter_application_sayurmayur/screen/sayur_detail.dart';

// Model untuk sayur
class Sayur {
  final String name;
  final String imageUrl;
  final int price;
  final bool isFavorite;

  Sayur({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });
}

class SayurPage extends StatelessWidget {
  const SayurPage({super.key});

  // Daftar sayur
  List<Sayur> get listSayurs => [
        Sayur(name: 'Bayam', imageUrl: 'assets/box1.jpg', price: 5000),
        Sayur(name: 'Cabai', imageUrl: 'assets/box2.jpg', price: 6000),
        Sayur(name: 'Kentang', imageUrl: 'assets/box3.jpg', price: 12000),
        Sayur(name: 'Sawi', imageUrl: 'assets/box4.jpg', price: 3000),
        Sayur(name: 'Terong', imageUrl: 'assets/box5.jpg', price: 3000),
        Sayur(name: 'Tomat', imageUrl: 'assets/box6.jpg', price: 3000),
        // Tambahkan sayuran lain sesuai kebutuhan
      ];

  @override
  Widget build(BuildContext context) {
    final items = listSayurs;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF8),
      body: Padding(
        padding: EdgeInsets.only(bottom: 80),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return _buildCard(items[index], context);
          },
          itemCount: items.length,
        ),
      ),
    );
  }

  Widget _buildCard(Sayur sayur, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SayurDetail(
              assetPath: sayur.imageUrl,
              sayurprice: sayur.price.toString(), // int -> String
              sayurname: sayur.name,
            );
          }));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0x339E9E9E),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    sayur.isFavorite
                        ? const Icon(Icons.favorite, color: Color(0xFFEF7532))
                        : const Icon(Icons.favorite_border,
                            color: Color(0xFFEF7532)),
                  ],
                ),
              ),
              SizedBox(
                height: 92,
                width: 92,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    sayur.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'Rp ${sayur.price}',
                  style: TextStyle(
                    color: const Color(0xFFCC8053),
                    fontFamily: 'Varela',
                    fontSize: 16,
                  ),
                ),
              ),
              Center(
                child: Text(
                  sayur.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: const Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.chat,
                            color: const Color(0xFFD17E50), size: 16),
                        SizedBox(width: 8),
                        Text(
                          'Chat',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            color: const Color(0xFFD17E50),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Row(
                      children: [
                        Icon(Icons.remove_circle_outline,
                            color: const Color(0xFFD17E50), size: 16),
                        SizedBox(width: 8),
                        Text(
                          '3',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            color: const Color(0xFFD17E50),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.add_circle_outline,
                            color: const Color(0xFFD17E50), size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
