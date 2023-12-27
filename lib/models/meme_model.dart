import 'dart:convert';

import 'package:flutter/foundation.dart';

class MemeModel {
  final String postLink;
  final String subreddit;
  final String title;
  final String url;
  final bool nsfw;
  final bool spoiler;
  final String author;
  final int ups;
  final List<String> preview;
  MemeModel({
    required this.postLink,
    required this.subreddit,
    required this.title,
    required this.url,
    required this.nsfw,
    required this.spoiler,
    required this.author,
    required this.ups,
    required this.preview,
  });

  MemeModel copyWith({
    String? postLink,
    String? subreddit,
    String? title,
    String? url,
    bool? nsfw,
    bool? spoiler,
    String? author,
    int? ups,
    List<String>? preview,
  }) {
    return MemeModel(
      postLink: postLink ?? this.postLink,
      subreddit: subreddit ?? this.subreddit,
      title: title ?? this.title,
      url: url ?? this.url,
      nsfw: nsfw ?? this.nsfw,
      spoiler: spoiler ?? this.spoiler,
      author: author ?? this.author,
      ups: ups ?? 0,
      preview: preview ?? this.preview,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postLink': postLink,
      'subreddit': subreddit,
      'title': title,
      'url': url,
      'nsfw': nsfw,
      'spoiler': spoiler,
      'author': author,
      'ups': ups,
      'preview': preview,
    };
  }

  factory MemeModel.fromMap(Map<String, dynamic> map) {
    return MemeModel(
      postLink: map['postLink'] ?? '',
      subreddit: map['subreddit'] ?? '',
      title: map['title'] ?? '',
      url: map['url'] ?? '',
      nsfw: map['nsfw'] ?? false,
      spoiler: map['spoiler'] ?? false,
      author: map['author'] ?? '',
      ups: map['ups'] ?? 0,
      preview: List<String>.from(map['preview']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MemeModel.fromJson(String source) =>
      MemeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MemeModel(postLink: $postLink, subreddit: $subreddit, title: $title, url: $url, nsfw: $nsfw, spoiler: $spoiler, author: $author, ups: $ups, preview: $preview)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MemeModel &&
        other.postLink == postLink &&
        other.subreddit == subreddit &&
        other.title == title &&
        other.url == url &&
        other.nsfw == nsfw &&
        other.spoiler == spoiler &&
        other.author == author &&
        other.ups == ups &&
        listEquals(other.preview, preview);
  }

  @override
  int get hashCode {
    return postLink.hashCode ^
        subreddit.hashCode ^
        title.hashCode ^
        url.hashCode ^
        nsfw.hashCode ^
        spoiler.hashCode ^
        author.hashCode ^
        ups.hashCode ^
        preview.hashCode;
  }
}

/**
 * Response type:
 * {
  "postLink": "https://redd.it/jiovfz",
  "subreddit": "dankmemes",
  "title": "*leaves call*",
  "url": "https://i.redd.it/f7ibqp1dmiv51.gif",
  "nsfw": false,
  "spoiler": false,
  "author": "Spartan-Yeet",
  "ups": 3363,

  // preview images of the meme sorted from lowest to highest quality
  "preview": [
    "https://preview.redd.it/f7ibqp1dmiv51.gif?width=108&crop=smart&format=png8&s=02b12609100c14f55c31fe046f413a9415804d62",
    "https://preview.redd.it/f7ibqp1dmiv51.gif?width=216&crop=smart&format=png8&s=8da35457641a045e88e42a25eca64c14a6759f82",
    "https://preview.redd.it/f7ibqp1dmiv51.gif?width=320&crop=smart&format=png8&s=f2250b007b8252c7063b8580c2aa72c5741766ae",
    "https://preview.redd.it/f7ibqp1dmiv51.gif?width=640&crop=smart&format=png8&s=6cd99df5e58c976bc115bd080a1e6afdbd0d71e7"
  ]
}
 */
