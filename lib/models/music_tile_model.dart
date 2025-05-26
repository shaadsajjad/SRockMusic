class MusicTileModel {
  final String title;
  final String subtitle;
  final String logo;
  final String bg;

  MusicTileModel({
    required this.title,
    required this.subtitle,
    required this.logo,
    required this.bg,
  });

  factory MusicTileModel.fromMap(Map<dynamic, dynamic> map) {
    return MusicTileModel(
      title: map['title'] ?? '',
      subtitle: map['subbtitle'] ?? '',
      logo: map['logo'] ?? '',
      bg: map['bg'] ?? '',
    );
  }
}
