import 'dart:convert';

DetailsResponse detailsResponseFromJson(String str) =>
    DetailsResponse.fromJson(json.decode(str));

String detailsResponseToJson(DetailsResponse data) =>
    json.encode(data.toJson());

class DetailsResponse {
  DetailsResponse({
    this.id,
    this.createdAt,
    this.createdAtI,
    this.type,
    this.author,
    this.title,
    this.text,
    this.url,
    this.points,
    this.parentId,
    this.storyId,
    this.children,
    this.options,
  });

  int id;
  DateTime createdAt;
  int createdAtI;
  String type;
  String author;
  String title;
  String text;
  String url;
  int points;
  int parentId;
  int storyId;
  List<DetailsResponse> children;
  List<dynamic> options;

  factory DetailsResponse.fromJson(Map<String, dynamic> json) =>
      DetailsResponse(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdAtI: json["created_at_i"] == null ? null : json["created_at_i"],
        type: json["type"] == null ? null : json["type"],
        author: json["author"] == null ? null : json["author"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
        text: json["text"] == null ? null : json["text"],
        points: json["points"] == null ? null : json["points"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        storyId: json["story_id"] == null ? null : json["story_id"],
        children: json["children"] == null
            ? null
            : List<DetailsResponse>.from(
                json["children"].map((x) => DetailsResponse.fromJson(x))),
        options: json["options"] == null
            ? null
            : List<dynamic>.from(json["options"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "text": text == null ? null : text,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "created_at_i": createdAtI == null ? null : createdAtI,
        "type": type == null ? null : type,
        "author": author == null ? null : author,
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "points": points == null ? null : points,
        "parent_id": parentId == null ? null : parentId,
        "story_id": storyId == null ? null : storyId,
        "children": children == null
            ? null
            : List<dynamic>.from(children.map((x) => x.toJson())),
        "options":
            options == null ? null : List<dynamic>.from(options.map((x) => x)),
      };
}
