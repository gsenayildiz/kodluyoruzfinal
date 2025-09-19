### Kodluyoruz Final

#### LoginPage

- Amacı: Kullanıcı girişi.
- Kullanılan kod/özellikler:
  - TextField: e-posta ve şifre girişi için
  - ElevatedButton: giriş butonu
  - Navigator.push / Navigator.pushReplacementNamed: sayfa geçişi
  - FirebaseAuth: kullanıcı doğrulama
  - ScaffoldMessenger: hata veya başarı mesajı gösterimi
  - Container + BoxDecoration: arka plan ve gradient

#### SignupPage

- Amacı: Kullanıcının uygulamaya yeni bir hesap oluşturmasını sağlamak.
- Kullanılan kod/özellikler:
  - TextField: İsim, Soyisim, Email, Şifre, Şifre Onayı giriş alanları
  - ElevatedButton: Kayıt işlemi butonu
  - FirebaseAuth: Kullanıcı kaydı
  - \_isLoading: Kayıt sırasında yükleniyor göstergesi
  - Navigator.pop: Kayıt sonrası login sayfasına geri yönlendirme
  - Navigator.push: “Zaten hesabın var mı? Giriş Yap” linki ile login sayfasına geçiş
  - Doğrulama: Şifre ve şifre onayı eşleşmeli, aksi durumda uyarı mesajı gösterilir

#### HomePage

- Amacı: Ana sayfa, bilgi kartları ve menü.
- Kullanılan kod/özellikler:
  - VideoPlayerController + VideoPlayer: arka planda video
  - Stack: video ve kartların üst üste gelmesi
  - Column + SingleChildScrollView: sayfa kaydırma ve kartlar
  - ExpandableCard (custom widget): bilgi kartları
  - IconButton + FontAwesomeIcons: sosyal medya ikonları
  - GestureDetector + setState: hamburger menü aç/kapa
  - Navigator.push: hesap ve geri bildirim sayfalarına geçiş

#### AccountPage

- Amacı:
- Kullanılan kod/özellikler:
  - Navigator.pop: sayfadan geri dön

#### FeedbackPage

- Amacı:
- Kullanılan kod/özellikler:
  - Navigator.pop: sayfadan geri dön
