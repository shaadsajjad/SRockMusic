
# Srock Music App

A Flutter music discovery app showcasing hand-picked music tiles fetched dynamically from Firebase Realtime Database.  
Built with Provider state management and MVVM architecture for clean and scalable code.

---

## Features

- Fetches music tiles data from Firebase Realtime Database
- Displays music tiles with background, logo, title, and subtitle
- Search bar UI (UI-only, no backend search yet)
- Navigation to a detailed screen on tile tap
- Responsive UI with loading indicator during data fetch
- Bottom navigation bar with custom icons
- Clean separation of concerns using MVVM architecture and Provider

---



## Getting Started

### Prerequisites

- Flutter SDK (>= 3.0.0)
- Firebase project with Realtime Database configured
- Android/iOS device or emulator

### Setup

1. **Clone the repo**

   ```bash
   git clone https://github.com/yourusername/srock_music_app.git
   cd srock_music_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure Firebase**

   - Create a Firebase project at [https://console.firebase.google.com](https://console.firebase.google.com)
   - Add Android and/or iOS app to Firebase project
   - Download `google-services.json` (Android) and/or `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate platform folders:
     - `android/app/google-services.json`
     - `ios/Runner/GoogleService-Info.plist`
   - Enable Realtime Database in Firebase Console and create a node named `musictile` with your music tile data.

4. **Run the app**

   ```bash
   flutter run
   ```

---

## Architecture

- **MVVM (Model-View-ViewModel)** pattern:
  - `models/` - Data models (`MusicTileModel`)
  - `viewmodels/` - Business logic and data fetching (`MusicTileViewModel`)
  - `views/` - UI widgets and screens (`Homescreen`, `Detailscreen`, `MusicTile` widget)

- **State management** with [Provider](https://pub.dev/packages/provider)

- **Firebase Realtime Database** used for dynamic data

---

## Folder Structure

```
lib/
├── models/
│   └── music_tile_model.dart
├── viewmodels/
│   └── music_tile_viewmodel.dart
├── views/
│   ├── homescreen.dart
│   └── detailScreen.dart
├── widgets/
│   └── music_tile.dart
└── main.dart
```

---





## Dependencies

- `flutter`
- `provider`
- `firebase_core`
- `firebase_database`

---





---

## Contact

If you have any questions or suggestions, feel free to reach out:

- Email: sajjadshaad4@gmail.com  
- GitHub: [shaadsajjad](https://github.com/shaadsajjad)
- Video:[vedio recording](https://youtu.be/C9sHHjSrmPE)
