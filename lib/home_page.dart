import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'expandable_card.dart';
import 'account_page.dart';
import 'feedback_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  bool _menuOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/login_bg.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller.value.isInitialized
          ? Stack(
              children: [
                // Video + Kartlar
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            VideoPlayer(_controller),
                            // Video üzerindeki yazılar
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Seçim Senin",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white70,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Nasıl Bir Gelecek İstiyorsun?",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          " Türkiye 'de Su Tüketimi💧",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ExpandableCard(
                        title: "Evde Su Tüketimi",
                        imagePath: "assets/card1.jpg",
                        content:
                            "Evlerde suyun %35’i banyoda, %30’u tuvalette, %20’si çamaşır ve bulaşıkta, %10’u yemek/içmede, %5’i temizlikte harcanır. Banyo ve tuvalet toplam tüketimin %70’ini oluşturur. Küvet yerine duş, rezervuar azaltma gibi yöntemlerle tasarruf mümkündür.",
                      ),
                      const SizedBox(height: 24),
                      ExpandableCard(
                        title: "Tarımda Su Tüketimi",
                        imagePath: "assets/card2.jpg",
                        content:
                            "Dünya genelinde tarımsal sulama toplam su kullanımının %70’ini oluşturur. Türkiye’de bu oran %77’dir. Sulama verimliliğinin artırılmasıyla büyük tasarruf sağlanabilir. Modern sistemler, yağmur suyu hasadı ve atıksu geri kullanımıyla randıman %75’e çıkarılabilir.",
                      ),
                      const SizedBox(height: 24),
                      ExpandableCard(
                        title: "Sanayide Su Tüketimi",
                        imagePath: "assets/card3.jpg",
                        content:
                            "Sanayi sektörü iklim değişikliğinden etkilenmektedir. Su temininde yaşanan sıkıntılar üretimi düşürmektedir. Temiz üretim teknolojileri, geri kazanım ve verimlilik tedbirleriyle sanayide %50’ye varan su tasarrufu mümkündür. Burdur Gölü büyüklüğünde su korunabilir.",
                      ),
                      const SizedBox(height: 24),
                      ExpandableCard(
                        title: "Kamuda Su Tüketimi",
                        imagePath: "assets/card4.jpg",
                        content:
                            "Türkiye’de içme suyu kayıp oranı 2021’de %33,54’tür. Hedef %25 olsa da gelişmiş ülkelerde %10 seviyelerine ulaşılmaktadır. Ölçüm sistemleri, uzaktan izleme, altyapı yenileme ve sızıntı kontrolüyle kayıplar azaltılabilir. Her damla değerlidir.",
                      ),
                      const SizedBox(height: 32),
                      // Sosyal medya ikonları
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.green,
                            ),
                            iconSize: 30,
                            onPressed: () =>
                                _launchURL("https://wa.me/123456789"),
                          ),
                          const SizedBox(width: 16),
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.pink,
                            ),
                            iconSize: 30,
                            onPressed: () =>
                                _launchURL("https://instagram.com/username"),
                          ),
                          const SizedBox(width: 16),
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.blue,
                            ),
                            iconSize: 30,
                            onPressed: () =>
                                _launchURL("https://linkedin.com/in/username"),
                          ),
                          const SizedBox(width: 16),
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blueAccent,
                            ),
                            iconSize: 30,
                            onPressed: () =>
                                _launchURL("https://facebook.com/username"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "kodluyoruz6final © tüm hakları saklıdır",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
                // Hamburger menü
                Positioned(
                  top: 40,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => _menuOpen = !_menuOpen),
                        child: const Icon(
                          Icons.menu,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      if (_menuOpen)
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.zero,
                            border: Border.all(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const AccountPage(),
                                    ),
                                  );
                                  setState(() => _menuOpen = false);
                                },
                                child: const Text(
                                  "Hesap",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const FeedbackPage(),
                                    ),
                                  );
                                  setState(() => _menuOpen = false);
                                },
                                child: const Text(
                                  "Geri Bildirim",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
