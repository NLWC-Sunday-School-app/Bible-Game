import 'dart:convert';

List<GlobalGames> gamesFromJson(String str) => List<GlobalGames>.from(json.decode(str).map((x) => GlobalGames.fromJson(x)));

class GlobalGames{
  int id;
  String title;
  String description;
  String imageUrl;
  String campaignTag;
  bool gameIsActive;

  GlobalGames({
    required this.id, required this.title, required this.description, required this.imageUrl,
    required this.campaignTag, required this.gameIsActive
});

  factory GlobalGames.fromJson(Map<String, dynamic> json) => GlobalGames(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      imageUrl: json["image"],
      campaignTag: json["campaign_tag"],
      gameIsActive: json["is_active"],
  );
}