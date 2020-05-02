
class FeedsList {
  final List<Feeds> allfeeds;
  FeedsList({this.allfeeds,});
  factory FeedsList.fromJson(List<dynamic> parsedJson) {
    List<Feeds> feeds = new List<Feeds>();
    feeds = parsedJson.map((i) => Feeds.fromJson(i)).toList();
    return FeedsList(allfeeds: feeds);
  }
  toString() {
        return '{$allfeeds}';
  }
}

class Feeds {
    int id;
    String name;
    String imagePath;
    MyPost post;
    List<PostComment> comments;

    Feeds({
        this.id,
        this.name,
        this.imagePath,
        this.post,
        this.comments,
    });

    factory Feeds.fromJson(Map<String, dynamic> json) => Feeds(
        id: json["id"],
        name: json["name"],
        imagePath: json["imagePath"],
        post: MyPost.fromJson(json["post"]),
        comments: List<PostComment>.from(json["comments"].map((x) => PostComment.fromJson(x))),
    );
    toString() {
        return '{$id, $name, $imagePath, $post, $comments}';
    }
    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imagePath": imagePath,
        "post": post.toJson(),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    };
    
}

class MyPost {
    String media;
    String title;
    MyPost({
        this.media,
        this.title,
    });
    factory MyPost.fromJson(Map<String, dynamic> json) => MyPost(
        media: json["media"],
        title: json["title"],
    );
    toString() {
        return '{$media, $title,}';
    }

    Map<String, dynamic> toJson() => {
        "media": media,
        "title": title,
    };
}
class PostComment {
    String name;
    String comment;

    PostComment({
        this.name,
        this.comment,
    });
    factory PostComment.fromJson(Map<String, dynamic> json) => PostComment(
        name: json["name"] as String,
        comment: json["comment"] as String,
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "comment": comment,
    };
}



