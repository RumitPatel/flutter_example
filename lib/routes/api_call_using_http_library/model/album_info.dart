class AlbumInfo {
  final int? userId;
  final int? id;
  final String? title;

  const AlbumInfo({
    required this.userId,
    required this.id,
    required this.title,
  });

  AlbumInfo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] as int,
        id = json['id'] as int,
        title = json['title'] as String;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
      };
}
