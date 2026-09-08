# Minha Food Delivery — Mian Channu

یہ Flutter starter app ہے۔ اس میں بنیادی customer UI شامل ہے:
- Home
- Food / Grocery / سبزی / Medicine / Other
- Cart icon
- Orders
- Profile
- Mian Channu-only branding

## اگلے production مراحل
1. Firebase/Supabase backend
2. Customer login/OTP
3. Real restaurants, shops اور products database
4. Cart + checkout
5. Cash on Delivery
6. Rider app/dashboard + live order status
7. Admin panel
8. Mian Channu service-area validation
9. Push notifications
10. Google Maps/location integration
11. Privacy Policy / Terms
12. Release signing اور Google Play Console پر AAB upload

## چلانے کا طریقہ
Flutter SDK انسٹال ہونے کے بعد:
flutter pub get
flutter run

Release:
flutter build appbundle --release

نوٹ: یہ starter source ہے؛ Play Store پر حقیقی orders چلانے کے لیے backend، database، authentication، payments/ordering logic اور admin/rider systems مکمل کرنا ضروری ہے۔

## Brand asset
The generated Minha Food Delivery promotional poster is included at `assets/minha_brand_poster.png` and displayed on the Home screen.

## V4 UI added
- Admin dashboard UI
- Rider dashboard UI
- Sample order cards
- Admin/Rider navigation from Profile for demonstration

## V5 Firebase backend scaffold
This version adds:
- Firebase Core/Auth/Firestore dependencies
- Order data model
- Firestore OrderService
- Admin order stream
- Rider order stream
- Status updates and rider assignment
- Starter Firestore security rules

### Final connection step
A Firebase project must be created under the owner's Google account. Then run:
flutterfire configure
This generates `firebase_options.dart` and connects Android/iOS to the selected Firebase project.

Phone OTP also requires enabling Phone Authentication in Firebase Console and configuring the Android app/SHA-1 or SHA-256 as required by Firebase.
