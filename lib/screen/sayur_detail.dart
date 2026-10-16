import 'package:flutter/material.dart';
import 'package:flutter_application_sayurmayur/widget/navbar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SayurDetail extends StatelessWidget {
  final String assetPath;
  final String sayurprice;
  final String sayurname;

  const SayurDetail({
    super.key,
    required this.assetPath,
    required this.sayurprice,
    required this.sayurname,
  });

  // Pengganti flutter_launch (package lama, sudah discontinued & gagal build)
  Future<void> _pesanViaWhatsapp(BuildContext context) async {
    final pesan =
        'Hi Tegar Sayur, Saya mau order $sayurname untuk hari ini, apa bisa diantar kerumah?';
    final uri = Uri.parse(
        'https://wa.me/628123456789?text=${Uri.encodeComponent(pesan)}');
    try {
      final berhasil =
          await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!berhasil && context.mounted) {
        _tampilkanError(context);
      }
    } catch (_) {
      if (context.mounted) _tampilkanError(context);
    }
  }

  void _tampilkanError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tidak dapat membuka WhatsApp')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pesan',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 24.0,
            color: const Color(0xFF545D68),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Sayur Mayur',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF17532),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Hero(
              tag: assetPath,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Center(
            child: Text(
              'Rp $sayurprice',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF17532),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Center(
            child: Text(
              sayurname,
              style: TextStyle(
                color: const Color(0xFF575E67),
                fontFamily: 'Varela',
                fontSize: 24.0,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 52.0,
              child: Text(
                'Sayur mayur yang diambil dari pertanian terbaik di Indonesia akan menjadi bahan dasar terbaik untuk membuat cita rasa masakan nusantara',
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16.0,
                  color: const Color(0xFFB4B8B9),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 100.0,
              height: 52.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xFFF17532),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(24.0),
                  onTap: () => _pesanViaWhatsapp(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat,
                        size: 32,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Pesan via Whatsapp',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 28.0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
