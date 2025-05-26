import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/music_tile_model.dart';

class MusicTileViewModel extends ChangeNotifier {
  List<MusicTileModel> _musicTileList = [];
  List<MusicTileModel> get musicTileList => _musicTileList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchMusicTileList() async {
    _isLoading = true;
    notifyListeners();

    final dbRef = FirebaseDatabase.instance.ref();
    final snapshot = await dbRef.child('musictile').get();

    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>;
      final sortedEntries = data.entries.toList()
        ..sort((a, b) => a.key.toString().compareTo(b.key.toString()));

      _musicTileList = sortedEntries.map((entry) {
        return MusicTileModel.fromMap(entry.value);
      }).toList();
    }

    _isLoading = false;
    notifyListeners();
  }
}
