// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  SearchResponse({
    this.hits,
    this.nbHits,
    this.page,
    this.nbPages,
    this.hitsPerPage,
    this.exhaustiveNbHits,
    this.query,
    this.params,
    this.processingTimeMs,
  });

  List<Hit> hits;
  int nbHits;
  int page;
  int nbPages;
  int hitsPerPage;
  bool exhaustiveNbHits;
  String query;
  String params;
  int processingTimeMs;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    hits: json["hits"] == null ? null : List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
    nbHits: json["nbHits"] == null ? null : json["nbHits"],
    page: json["page"] == null ? null : json["page"],
    nbPages: json["nbPages"] == null ? null : json["nbPages"],
    hitsPerPage: json["hitsPerPage"] == null ? null : json["hitsPerPage"],
    exhaustiveNbHits: json["exhaustiveNbHits"] == null ? null : json["exhaustiveNbHits"],
    query: json["query"] == null ? null : json["query"],
    params: json["params"] == null ? null : json["params"],
    processingTimeMs: json["processingTimeMS"] == null ? null : json["processingTimeMS"],
  );

  Map<String, dynamic> toJson() => {
    "hits": hits == null ? null : List<dynamic>.from(hits.map((x) => x.toJson())),
    "nbHits": nbHits == null ? null : nbHits,
    "page": page == null ? null : page,
    "nbPages": nbPages == null ? null : nbPages,
    "hitsPerPage": hitsPerPage == null ? null : hitsPerPage,
    "exhaustiveNbHits": exhaustiveNbHits == null ? null : exhaustiveNbHits,
    "query": query == null ? null : query,
    "params": params == null ? null : params,
    "processingTimeMS": processingTimeMs == null ? null : processingTimeMs,
  };
}

class Hit {
  Hit({
    this.createdAt,
    this.title,
    this.url,
    this.author,
    this.points,
    this.storyText,
    this.commentText,
    this.numComments,
    this.storyId,
    this.storyTitle,
    this.storyUrl,
    this.parentId,
    this.createdAtI,
    this.tags,
    this.objectId,
    this.highlightResult,
  });

  DateTime createdAt;
  String title;
  String url;
  String author;
  int points;
  dynamic storyText;
  dynamic commentText;
  int numComments;
  dynamic storyId;
  dynamic storyTitle;
  dynamic storyUrl;
  dynamic parentId;
  int createdAtI;
  List<String> tags;
  String objectId;
  HighlightResult highlightResult;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    title: json["title"] == null ? null : json["title"],
    url: json["url"] == null ? null : json["url"],
    author: json["author"] == null ? null : json["author"],
    points: json["points"] == null ? null : json["points"],
    storyText: json["story_text"],
    commentText: json["comment_text"],
    numComments: json["num_comments"] == null ? null : json["num_comments"],
    storyId: json["story_id"],
    storyTitle: json["story_title"],
    storyUrl: json["story_url"],
    parentId: json["parent_id"],
    createdAtI: json["created_at_i"] == null ? null : json["created_at_i"],
    tags: json["_tags"] == null ? null : List<String>.from(json["_tags"].map((x) => x)),
    objectId: json["objectID"] == null ? null : json["objectID"],
    highlightResult: json["_highlightResult"] == null ? null : HighlightResult.fromJson(json["_highlightResult"]),
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "title": title == null ? null : title,
    "url": url == null ? null : url,
    "author": author == null ? null : author,
    "points": points == null ? null : points,
    "story_text": storyText,
    "comment_text": commentText,
    "num_comments": numComments == null ? null : numComments,
    "story_id": storyId,
    "story_title": storyTitle,
    "story_url": storyUrl,
    "parent_id": parentId,
    "created_at_i": createdAtI == null ? null : createdAtI,
    "_tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
    "objectID": objectId == null ? null : objectId,
    "_highlightResult": highlightResult == null ? null : highlightResult.toJson(),
  };
}

class HighlightResult {
  HighlightResult({
    this.title,
    this.url,
    this.author,
  });

  Author title;
  Author url;
  Author author;

  factory HighlightResult.fromJson(Map<String, dynamic> json) => HighlightResult(
    title: json["title"] == null ? null : Author.fromJson(json["title"]),
    url: json["url"] == null ? null : Author.fromJson(json["url"]),
    author: json["author"] == null ? null : Author.fromJson(json["author"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title.toJson(),
    "url": url == null ? null : url.toJson(),
    "author": author == null ? null : author.toJson(),
  };
}

class Author {
  Author({
    this.value,
    this.matchLevel,
    this.matchedWords,
    this.fullyHighlighted,
  });

  String value;
  String matchLevel;
  List<String> matchedWords;
  bool fullyHighlighted;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    value: json["value"] == null ? null : json["value"],
    matchLevel: json["matchLevel"] == null ? null : json["matchLevel"],
    matchedWords: json["matchedWords"] == null ? null : List<String>.from(json["matchedWords"].map((x) => x)),
    fullyHighlighted: json["fullyHighlighted"] == null ? null : json["fullyHighlighted"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
    "matchLevel": matchLevel == null ? null : matchLevel,
    "matchedWords": matchedWords == null ? null : List<dynamic>.from(matchedWords.map((x) => x)),
    "fullyHighlighted": fullyHighlighted == null ? null : fullyHighlighted,
  };
}
