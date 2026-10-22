
import 'package:flutter/material.dart';

void main() {
  runApp(const GaleriFotoApp());
}

class GaleriFotoApp extends StatelessWidget {
  const GaleriFotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galeri Foto',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: const Color(0xFF1976D2),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1976D2),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      home: const GaleriFotoPage(),
    );
  }
}

class GaleriFotoPage extends StatelessWidget {
  const GaleriFotoPage({super.key});

  static const String imageUrl =
      'https://picsum.photos/id/88/300/200';

  static const String deskripsi =
      'Sebuah persimpangan jalan di Barcelona, Spanyol. '
      'Foto ini menampilkan berbagai kendaraan yang bergerak '
      'dalam arah yang berbeda, menciptakan pemandangan yang '
      'sibuk dan energik.';

  @override
  Widget build(BuildContext context) {
    final lebarLayar = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Foto'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Gambar utama
              SizedBox(
                width: double.infinity,
                height: lebarLayar * 0.63,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) {
                      return child;
                    }

                    return const ColoredBox(
                      color: Color(0xFFEEEEEE),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF1976D2),
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const ColoredBox(
                      color: Color(0xFFEEEEEE),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.broken_image_outlined,
                              size: 45,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Gambar gagal dimuat.\n'
                              'Periksa koneksi internet.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Judul dan informasi foto
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  24, 22, 24, 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Jalan di Barcelona',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222222),
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFEEEEEE),
                    ),

                    const SizedBox(height: 22),

                    const InfoFoto(
                      icon: Icons.place,
                      warnaIkon: Color(0xFFE74C3C),
                      teks: 'Lokasi: Barcelona, Spanyol',
                    ),

                    const SizedBox(height: 16),

                    const InfoFoto(
                      icon: Icons.calendar_month,
                      warnaIkon: Color(0xFF2196F3),
                      teks: 'Publikasi: 13 Agustus 2013',
                    ),

                    const SizedBox(height: 22),

                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFEEEEEE),
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222222),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      deskripsi,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.35,
                        color: Color(0xFF333333),
                      ),
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

// Widget untuk informasi lokasi dan tanggal
class InfoFoto extends StatelessWidget {
  final IconData icon;
  final Color warnaIkon;
  final String teks;

  const InfoFoto({
    super.key,
    required this.icon,
    required this.warnaIkon,
    required this.teks,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: warnaIkon,
          size: 26,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            teks,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF444444),
            ),
          ),
        ),
      ],
    );
  }
}
