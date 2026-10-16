# flutter_application_sayurmayur (Praktikum PAM W6S2S3)

## Penyebab error merah di VS Code
Package `flutter_screenutil` (dan `url_launcher`) belum ada di pubspec.yaml,
sehingga semua file yang memakai `.sp`, `.h`, `.w`, `ScreenUtilInit` jadi error.
Package `flutter_launch` di modul sudah discontinued, diganti `url_launcher`.

## Cara memperbaiki di project yang sudah ada
1. Di folder project: `flutter pub add flutter_screenutil url_launcher font_awesome_flutter`
2. Pastikan pubspec.yaml punya:
   flutter:
     uses-material-design: true
     assets:
       - assets/
3. Ganti isi folder `lib/` dengan `lib/` dari zip ini.
4. Pastikan assets/box1.jpg ... box6.jpg ada (nama sama persis dengan di sayur_page.dart).
5. `flutter clean` -> `flutter pub get` -> `flutter run`

## Android 11+ (wajib agar tombol WhatsApp jalan)
Di `android/app/src/main/AndroidManifest.xml`, di dalam `<manifest>` (di luar `<application>`):
<queries>
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="https" />
  </intent>
</queries>
